import 'package:flutter/material.dart';
import '../../../../domain/models/user_model.dart';
import '../../../../data/repositories/user_repository.dart';

/// プロフィール・支援設定画面
/// 自分の属性やスキルを登録し、共助をスムーズに
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _userRepository = UserRepository();
  
  String _selectedLanguage = 'ja';
  String? _selectedNationality;
  String? _selectedReligiousConsiderations;
  List<String> _selectedNeeds = [];
  List<String> _selectedSkills = [];
  Map<String, bool> _privacySettings = {
    'showLanguage': true,
    'showNationality': true,
    'showSkills': true,
    'showNeeds': false,
  };

  final List<String> _availableLanguages = ['ja', 'en', 'zh', 'es', 'ko', 'vi'];
  final List<String> _availableNationalities = ['JP', 'US', 'CN', 'KR', 'VN', 'TH', 'ES', 'FR'];
  final List<String> _availableReligiousConsiderations = ['ハラール対応', 'コーシャ対応', 'ベジタリアン対応'];
  final List<String> _availableNeeds = ['持病あり', '妊娠中', '子連れ', '高齢者', '車椅子利用'];
  final List<String> _availableSkills = [
    '力仕事ができます',
    '応急処置ができます',
    '医療従事者です',
    '日本語と英語が話せます',
    '子連れのサポートができます',
    '翻訳ができます',
    '情報収集ができます',
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final user = await _userRepository.getCurrentUser();
    if (user != null) {
      setState(() {
        _nameController.text = user.name;
        _selectedLanguage = user.language;
        _selectedNationality = user.nationality;
        _selectedReligiousConsiderations = user.religiousConsiderations;
        _selectedNeeds = user.needs ?? [];
        _selectedSkills = user.skills ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール設定'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveProfile,
            tooltip: '保存',
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 基本情報セクション
              _buildSectionTitle('基本情報'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: '名前',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '名前を入力してください';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedLanguage,
                        decoration: const InputDecoration(
                          labelText: '使用言語',
                          border: OutlineInputBorder(),
                        ),
                        items: _availableLanguages.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(_getLanguageName(lang)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _selectedLanguage = value!);
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedNationality,
                        decoration: const InputDecoration(
                          labelText: '国籍（任意）',
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          const DropdownMenuItem(value: null, child: Text('選択しない')),
                          ..._availableNationalities.map((nat) {
                            return DropdownMenuItem(
                              value: nat,
                              child: Text(nat),
                            );
                          }),
                        ],
                        onChanged: (value) {
                          setState(() => _selectedNationality = value);
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedReligiousConsiderations,
                        decoration: const InputDecoration(
                          labelText: '宗教的配慮（任意）',
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          const DropdownMenuItem(value: null, child: Text('選択しない')),
                          ..._availableReligiousConsiderations.map((rel) {
                            return DropdownMenuItem(
                              value: rel,
                              child: Text(rel),
                            );
                          }),
                        ],
                        onChanged: (value) {
                          setState(() => _selectedReligiousConsiderations = value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // スキル登録セクション
              _buildSectionTitle('できること（スキル）'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '自分が提供できる支援を選択してください',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _availableSkills.map((skill) {
                          final isSelected = _selectedSkills.contains(skill);
                          return FilterChip(
                            label: Text(skill),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedSkills.add(skill);
                                } else {
                                  _selectedSkills.remove(skill);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 支援が必要な事項セクション
              _buildSectionTitle('支援が必要な事項（任意）'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '支援が必要な事項があれば選択してください',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _availableNeeds.map((need) {
                          final isSelected = _selectedNeeds.contains(need);
                          return FilterChip(
                            label: Text(need),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedNeeds.add(need);
                                } else {
                                  _selectedNeeds.remove(need);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // プライバシー設定セクション
              _buildSectionTitle('プライバシー設定'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: const Text('言語を公開'),
                        subtitle: const Text('周辺ユーザーに言語を表示'),
                        value: _privacySettings['showLanguage'] ?? true,
                        onChanged: (value) {
                          setState(() => _privacySettings['showLanguage'] = value);
                        },
                      ),
                      const Divider(),
                      SwitchListTile(
                        title: const Text('国籍を公開'),
                        subtitle: const Text('周辺ユーザーに国籍を表示'),
                        value: _privacySettings['showNationality'] ?? true,
                        onChanged: (value) {
                          setState(() => _privacySettings['showNationality'] = value);
                        },
                      ),
                      const Divider(),
                      SwitchListTile(
                        title: const Text('スキルを公開'),
                        subtitle: const Text('周辺ユーザーにスキルを表示'),
                        value: _privacySettings['showSkills'] ?? true,
                        onChanged: (value) {
                          setState(() => _privacySettings['showSkills'] = value);
                        },
                      ),
                      const Divider(),
                      SwitchListTile(
                        title: const Text('支援が必要な事項を公開'),
                        subtitle: const Text('周辺ユーザーに支援が必要な事項を表示'),
                        value: _privacySettings['showNeeds'] ?? false,
                        onChanged: (value) {
                          setState(() => _privacySettings['showNeeds'] = value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getLanguageName(String code) {
    const names = {
      'ja': '日本語',
      'en': '英語',
      'zh': '中国語',
      'es': 'スペイン語',
      'ko': '韓国語',
      'vi': 'ベトナム語',
    };
    return names[code] ?? code;
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final userId = _userRepository.getUserId() ?? 'current_user';
    final updatedUser = UserModel(
      id: userId,
      name: _nameController.text,
      language: _selectedLanguage,
      nationality: _selectedNationality,
      religiousConsiderations: _selectedReligiousConsiderations,
      needs: _selectedNeeds.isEmpty ? null : _selectedNeeds,
      skills: _selectedSkills.isEmpty ? null : _selectedSkills,
      updatedAt: DateTime.now(),
    );

    await _userRepository.saveUser(updatedUser);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('プロフィールを保存しました')),
      );
    }
  }
}

