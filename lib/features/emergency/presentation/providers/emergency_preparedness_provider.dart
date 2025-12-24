import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../domain/models/evacuation_item.dart';

part 'emergency_preparedness_provider.g.dart';

/// 防災準備（持ち出し品・緊急連絡先）Provider
@riverpod
class EmergencyPreparedness extends _$EmergencyPreparedness {
  @override
  EmergencyPreparednessState build() {
    return EmergencyPreparednessState(
      items: const [
        EvacuationItem(id: 'water', name: '飲料水'),
        EvacuationItem(id: 'food', name: '非常食'),
        EvacuationItem(id: 'medicine', name: '常備薬'),
        EvacuationItem(id: 'cash', name: '現金（小銭）'),
        EvacuationItem(id: 'light', name: '懐中電灯'),
      ],
      contacts: const [
        EmergencyContact(name: '警視庁', phone: '110'),
        EmergencyContact(name: '消防庁', phone: '119'),
        EmergencyContact(name: '家族', phone: '090-0000-0000'),
        EmergencyContact(name: '友人', phone: '080-0000-0000'),
      ],
    );
  }

  /// 持ち出し品のチェック切替
  void toggleItem(String id) {
    state = state.copyWith(
      items: state.items
          .map(
            (e) => e.id == id
                ? e.copyWith(checked: !e.checked)
                : e,
          )
          .toList(),
    );
  }

  /// 持ち出し品追加
  void addItem(String name) {
    state = state.copyWith(
      items: [
        ...state.items,
        EvacuationItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: name,
        ),
      ],
    );
  }

  /// 持ち出し品削除
  void removeItem(String id) {
    state = state.copyWith(
      items: state.items.where((e) => e.id != id).toList(),
    );
  }

  /// 緊急連絡先追加
  void addContact(String name, String phone) {
    state = state.copyWith(
      contacts: [...state.contacts, EmergencyContact(name: name, phone: phone)],
    );
  }

  /// 緊急連絡先削除
  void removeContact(String name) {
    state = state.copyWith(
      contacts: state.contacts.where((e) => e.name != name).toList(),
    );
  }
}

/// 防災準備State
@immutable
class EmergencyPreparednessState {
  final List<EvacuationItem> items;
  final List<EmergencyContact> contacts;

  const EmergencyPreparednessState({
    required this.items,
    required this.contacts,
  });

  EmergencyPreparednessState copyWith({
    List<EvacuationItem>? items,
    List<EmergencyContact>? contacts,
  }) {
    return EmergencyPreparednessState(
      items: items ?? this.items,
      contacts: contacts ?? this.contacts,
    );
  }
}

/// 緊急連絡先Model（Demo用）
@immutable
class EmergencyContact {
  final String name;
  final String phone;

  const EmergencyContact({
    required this.name,
    required this.phone,
  });
}
