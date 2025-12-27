import '../providers/language_provider.dart';

/// Demo 用のアプリ内文字列（日本語・英語・中国語・韓国語）
const appStrings = {
  // ===== タブ =====
  'tab_info': {
    AppLanguage.ja: '情報',
    AppLanguage.en: 'Info',
    AppLanguage.zh: '信息',
    AppLanguage.ko: '정보',
  },
  'tab_community': {
    AppLanguage.ja: 'コミュニティ',
    AppLanguage.en: 'Community',
    AppLanguage.zh: '社区',
    AppLanguage.ko: '커뮤니티',
  },
  'tab_map': {
    AppLanguage.ja: 'マップ',
    AppLanguage.en: 'Map',
    AppLanguage.zh: '地图',
    AppLanguage.ko: '지도',
  },
  'tab_preparedness': {
    AppLanguage.ja: '防災準備',
    AppLanguage.en: 'Preparedness',
    AppLanguage.zh: '防灾准备',
    AppLanguage.ko: '재난 대비',
  },

  // ===== 防災準備 =====
  'disaster_preparedness': {
    AppLanguage.ja: '防災準備',
    AppLanguage.en: 'Disaster Preparedness',
    AppLanguage.zh: '防灾准备',
    AppLanguage.ko: '재난 대비',
  },
  'evacuation_items': {
    AppLanguage.ja: '持ち出し品',
    AppLanguage.en: 'Emergency Items',
    AppLanguage.zh: '避难物品',
    AppLanguage.ko: '비상 물품',
  },
  'checklist_note': {
    AppLanguage.ja: '災害時に持ち出した物をチェックしてください',
    AppLanguage.en: 'Check items you have taken during an emergency',
    AppLanguage.zh: '请勾选已携带的物品',
    AppLanguage.ko: '비상 시 챙긴 물품을 체크하세요',
  },

  // ===== 緊急連絡 =====
  'emergency_contacts': {
    AppLanguage.ja: '緊急連絡先',
    AppLanguage.en: 'Emergency Contacts',
    AppLanguage.zh: '紧急联系人',
    AppLanguage.ko: '긴급 연락처',
  },
  'police': {
    AppLanguage.ja: '警察',
    AppLanguage.en: 'Police',
    AppLanguage.zh: '警察',
    AppLanguage.ko: '경찰',
  },
  'fire_department': {
    AppLanguage.ja: '消防',
    AppLanguage.en: 'Fire Department',
    AppLanguage.zh: '消防',
    AppLanguage.ko: '소방',
  },
  'disaster_center': {
    AppLanguage.ja: '防災センター',
    AppLanguage.en: 'Disaster Center',
    AppLanguage.zh: '防灾中心',
    AppLanguage.ko: '재난 센터',
  },

  // ===== 通話デモ =====
  'calling': {
    AppLanguage.ja: '発信中...',
    AppLanguage.en: 'Calling...',
    AppLanguage.zh: '正在拨号…',
    AppLanguage.ko: '전화 거는 중...',
  },
  'cancel': {
    AppLanguage.ja: 'キャンセル',
    AppLanguage.en: 'Cancel',
    AppLanguage.zh: '取消',
    AppLanguage.ko: '취소',
  },

  // ===== 言語切替 =====
  'language': {
    AppLanguage.ja: '言語',
    AppLanguage.en: 'Language',
    AppLanguage.zh: '语言',
    AppLanguage.ko: '언어',
  },
  'japanese': {
    AppLanguage.ja: '日本語',
    AppLanguage.en: 'Japanese',
    AppLanguage.zh: '日语',
    AppLanguage.ko: '일본어',
  },
  'english': {
    AppLanguage.ja: '英語',
    AppLanguage.en: 'English',
    AppLanguage.zh: '英语',
    AppLanguage.ko: '영어',
  },
  'chinese': {
    AppLanguage.ja: '中国語',
    AppLanguage.en: 'Chinese',
    AppLanguage.zh: '中文',
    AppLanguage.ko: '중국어',
  },
  'korean': {
    AppLanguage.ja: '韓国語',
    AppLanguage.en: 'Korean',
    AppLanguage.zh: '韩语',
    AppLanguage.ko: '한국어',
  },

    // ===== InfoPage =====
  'info_title': {
    AppLanguage.ja: '災害情報',
    AppLanguage.en: 'Disaster Information',
    AppLanguage.zh: '灾害信息',
    AppLanguage.ko: '재난 정보',
  },
  'last_updated': {
    AppLanguage.ja: '最終更新：',
    AppLanguage.en: 'Last updated:',
    AppLanguage.zh: '最后更新：',
    AppLanguage.ko: '최종 업데이트:',
  },
  'current_disaster': {
    AppLanguage.ja: '現在の災害状況',
    AppLanguage.en: 'Current Disaster Situation',
    AppLanguage.zh: '当前灾害情况',
    AppLanguage.ko: '현재 재난 상황',
  },
  'earthquake_message': {
    AppLanguage.ja: '地震が発生しました。安全な場所に避難してください。',
    AppLanguage.en:
        'An earthquake has occurred. Please evacuate to a safe place.',
    AppLanguage.zh: '发生地震，请前往安全地点避难。',
    AppLanguage.ko: '지진이 발생했습니다. 안전한 곳으로 대피하세요.',
  },
  'evacuation_required': {
    AppLanguage.ja: '避難が必要です',
    AppLanguage.en: 'Evacuation Required',
    AppLanguage.zh: '需要避难',
    AppLanguage.ko: '대피가 필요합니다',
  },
  'evacuation_check': {
    AppLanguage.ja: '避難時チェック',
    AppLanguage.en: 'Evacuation Checklist',
    AppLanguage.zh: '避难检查',
    AppLanguage.ko: '대피 체크',
  },
  'calling_suffix': {
    AppLanguage.ja: ' に発信中…',
    AppLanguage.en: ' is calling…',
    AppLanguage.zh: ' 正在拨号…',
    AppLanguage.ko: ' 에 전화 중...',
  },
  'evacuation_info': {
    AppLanguage.ja: '避難情報',
    AppLanguage.en: 'Evacuation Information',
    AppLanguage.zh: '避难信息',
    AppLanguage.ko: '대피 정보',
  },
  'why_evacuate': {
    AppLanguage.ja: 'なぜ避難するか',
    AppLanguage.en: 'Why Evacuate',
    AppLanguage.zh: '为何需要避难',
    AppLanguage.ko: '왜 대피해야 하나요',
  },
  'why_evacuate_desc': {
    AppLanguage.ja: '建物の倒壊や火災の危険があります。',
    AppLanguage.en:
        'There is a risk of building collapse and fire.',
    AppLanguage.zh: '存在建筑倒塌或火灾的危险。',
    AppLanguage.ko: '건물 붕괴나 화재의 위험이 있습니다.',
  },
  'evacuation_time': {
    AppLanguage.ja: '避難までの時間',
    AppLanguage.en: 'Time to Evacuate',
    AppLanguage.zh: '避难时间',
    AppLanguage.ko: '대피까지의 시간',
  },
  'evacuation_time_desc': {
    AppLanguage.ja: '30分以内に避難を開始してください。',
    AppLanguage.en:
        'Please start evacuating within 30 minutes.',
    AppLanguage.zh: '请在30分钟内开始避难。',
    AppLanguage.ko: '30분 이내에 대피를 시작하세요.',
  },
  'column': {
    AppLanguage.ja: 'コラム',
    AppLanguage.en: 'Column',
    AppLanguage.zh: '专栏',
    AppLanguage.ko: '칼럼',
  },
  'women_info': {
    AppLanguage.ja: '女性向け情報',
    AppLanguage.en: 'Information for Women',
    AppLanguage.zh: '女性相关信息',
    AppLanguage.ko: '여성 대상 정보',
  },
  'women_info_desc': {
    AppLanguage.ja: '避難所での安全対策や必要な物品について',
    AppLanguage.en:
        'Safety measures and necessary items at shelters',
    AppLanguage.zh: '避难所的安全措施及所需物品',
    AppLanguage.ko:
        '대피소에서의 안전 대책과 필요한 물품',
  },
  'first_aid': {
    AppLanguage.ja: '応急処置',
    AppLanguage.en: 'First Aid',
    AppLanguage.zh: '急救',
    AppLanguage.ko: '응급 처치',
  },
  'first_aid_desc': {
    AppLanguage.ja: '怪我をした場合の基本的な応急処置方法',
    AppLanguage.en:
        'Basic first aid methods for injuries',
    AppLanguage.zh: '受伤时的基本急救方法',
    AppLanguage.ko:
        '부상 시 기본적인 응급 처치 방법',
  },
};

/// 翻訳関数
String t(String key, AppLanguage lang) {
  return appStrings[key]?[lang] ?? key;
}

