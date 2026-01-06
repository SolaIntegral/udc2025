# Resilient Mesh Nav - 技術詳細情報

## A. プロジェクト構造・技術スタック

### 1. プロジェクトのディレクトリ構造

```
udc2025/
├── lib/
│   ├── main.dart                    # アプリエントリーポイント
│   ├── app.dart                     # アプリケーション設定・ルーティング
│   ├── core/                        # コア機能
│   │   ├── constants/              # 定数定義
│   │   ├── extensions/             # 拡張メソッド
│   │   └── widgets/                # 共通ウィジェット
│   ├── data/                        # データ層
│   │   ├── local/                  # ローカルストレージ
│   │   └── repositories/           # リポジトリパターン
│   ├── domain/                      # ドメイン層
│   │   └── models/                 # データモデル（19モデル）
│   └── features/                    # 機能別モジュール
│       ├── communication/          # コミュニケーション機能
│       ├── emergency/              # 緊急時機能
│       ├── group/                  # グループ管理
│       ├── home/                   # ホーム画面
│       ├── info/                   # 情報表示
│       ├── map/                    # マップ機能
│       ├── offline_comm/           # オフライン通信
│       └── onboarding/             # オンボーディング
├── android/                         # Android設定
├── ios/                            # iOS設定
├── web/                            # Web設定
└── pubspec.yaml                    # 依存関係定義
```

### 2. 使用している主要パッケージ/ライブラリ

#### UI・デザイン
- `flutter_svg: ^2.0.10+1` - SVG画像表示
- `cupertino_icons: ^1.0.8` - iOSスタイルアイコン

#### 状態管理
- `flutter_riverpod: ^2.6.1` - 状態管理フレームワーク
- `riverpod_annotation: ^2.6.1` - Riverpodコード生成

#### ルーティング
- `go_router: ^14.6.2` - 宣言的ルーティング

#### 地図・位置情報
- `flutter_map: ^7.0.2` - 地図表示ライブラリ
- `latlong2: ^0.9.1` - 座標計算
- `geolocator: ^13.0.1` - 位置情報取得

#### 通信
- `flutter_blue_plus: ^1.32.5` - Bluetooth通信（モバイル版のみ）

#### データ管理
- `shared_preferences: ^2.3.3` - ローカルキー・バリューストレージ

#### 多言語対応
- `intl: ^0.20.2` - 国際化・日時フォーマット
- `flutter_localizations` - Flutter標準の多言語対応

#### 外部連携
- `url_launcher: ^6.3.0` - 電話・外部リンク起動

#### コード生成
- `freezed: ^2.5.7` - イミュータブルなデータクラス生成
- `json_serializable: ^6.8.0` - JSONシリアライゼーション
- `build_runner: ^2.4.13` - コード生成ツール
- `riverpod_generator: ^2.6.2` - Riverpodプロバイダー生成

#### ユーティリティ
- `uuid: ^4.5.1` - UUID生成

### 3. Flutter SDKバージョン
- **Dart SDK**: `^3.8.1`
- **Flutter SDK**: （環境により異なる、通常は最新の安定版）

### 4. 対応プラットフォーム
- ✅ **Android**: 対応済み
- ✅ **iOS**: 対応済み
- ✅ **Web**: 対応済み（Bluetooth機能は制限あり）

---

## B. 実装済み機能の詳細リストとファイルパス

### 1. Bluetooth通信・メッシュネットワーク機能
**実装状況**: 🔄 実装中（構造のみ実装済み）

**主要ファイル**:
- `lib/features/offline_comm/services/bluetooth_mesh_service.dart` - Bluetooth Mesh通信サービス（TODO実装）
- `lib/features/offline_comm/presentation/providers/bluetooth_provider.dart` - Bluetooth状態管理（TODO実装）
- `lib/core/constants/app_constants.dart` - Bluetooth関連定数

**説明**: 
- Bluetooth Mesh通信の構造は実装済みだが、実際のデバイス検索・通信ロジックはTODO
- `flutter_blue_plus`パッケージを使用予定
- 通信範囲: 半径50m（設計値）

---

### 2. 多言語対応・翻訳機能
**実装状況**: ✅ 実装済み（UI構造のみ、翻訳機能は未実装）

**主要ファイル**:
- `lib/core/widgets/language_filter_tag.dart` - 言語フィルタータグ
- `lib/features/communication/presentation/pages/radar_page.dart` - 多言語フィルター実装
- `lib/features/communication/presentation/pages/chat_page.dart` - 多言語フィルター実装
- `lib/domain/models/user_model.dart` - ユーザーの言語情報を保持

**説明**:
- 5言語以上に対応（日本語、英語、中国語、スペイン語、韓国語）
- 言語フィルター機能は実装済み
- メッセージの自動翻訳機能は構造のみ実装済み（TODO）

---

### 3. 地図表示・避難所表示機能
**実装状況**: ✅ 実装済み

**主要ファイル**:
- `lib/features/map/presentation/pages/map_page.dart` - マップ画面（地図表示、マーカー、ポリライン）
- `lib/features/map/presentation/providers/map_provider.dart` - 地図状態管理
- `lib/core/constants/app_constants.dart` - 地図関連定数（デフォルト座標、ズームレベル）

**説明**:
- `flutter_map`を使用した地図表示
- OpenStreetMapタイルを使用
- 避難経路のポリライン表示
- マーカー表示（現在地、避難所、家族の位置）
- オフラインマップのダウンロード機能は構造のみ実装済み（TODO）

---

### 4. GTFS連携・公共交通情報表示
**実装状況**: 📋 未実装（構造のみ）

**主要ファイル**:
- `lib/features/map/data/gtfs_service.dart` - GTFSデータサービス（TODO実装）

**説明**:
- GTFSデータの取得・解析サービスの構造は実装済み
- 実際のGTFSデータ取得・表示機能は未実装（TODO）

---

### 5. 安否確認・グループ管理機能
**実装状況**: ✅ 実装済み（UI実装完了）

**主要ファイル**:
- `lib/features/group/presentation/pages/group_list_page.dart` - グループ一覧
- `lib/features/group/presentation/pages/group_create_page.dart` - グループ作成
- `lib/features/group/presentation/pages/group_member_add_page.dart` - メンバー追加
- `lib/features/group/presentation/providers/group_provider.dart` - グループ状態管理
- `lib/features/communication/presentation/pages/safety_page.dart` - グループ安否確認画面
- `lib/data/repositories/group_repository.dart` - グループデータ管理
- `lib/domain/models/group_model.dart` - グループデータモデル

**説明**:
- グループの作成、メンバー追加、削除機能
- グループメンバーの安否ステータス確認
- ローカルストレージ（SharedPreferences）に保存

---

### 6. SOS発信・レーダー検索機能
**実装状況**: ✅ 実装済み（UI実装完了、バックエンドは構造のみ）

**主要ファイル**:
- `lib/features/emergency/presentation/pages/sos_page.dart` - SOS発信画面
- `lib/features/emergency/services/emergency_service.dart` - 緊急時サービス（Bluetooth通信はTODO）
- `lib/features/communication/presentation/pages/radar_page.dart` - 周辺ユーザー探索画面
- `lib/features/communication/presentation/widgets/user_card.dart` - ユーザーカード表示
- `lib/domain/models/nearby_user_model.dart` - 周辺ユーザーデータモデル
- `lib/domain/models/emergency_status_model.dart` - 緊急ステータスデータモデル

**説明**:
- SOS発信UIは実装済み
- 周辺ユーザー探索UIは実装済み（モックデータで動作確認可能）
- 実際のBluetooth検索・通信は構造のみ実装済み（TODO）

---

### 7. スキルマッチング機能
**実装状況**: ✅ 実装済み（UI実装完了）

**主要ファイル**:
- `lib/core/widgets/skill_tag.dart` - スキルタグ表示
- `lib/features/communication/presentation/pages/profile_page.dart` - プロフィール設定画面
- `lib/features/communication/presentation/pages/radar_page.dart` - スキル表示
- `lib/domain/models/user_model.dart` - ユーザーのスキル情報を保持

**説明**:
- スキル登録・表示機能
- スキルタグによる視覚的な表示
- 支援が必要な事項の登録・表示
- スキルマッチングのUIは実装済み（実際のマッチングロジックは構造のみ）

---

### 8. オフラインデータ管理
**実装状況**: ✅ 実装済み

**主要ファイル**:
- `lib/data/local/shared_preferences_service.dart` - SharedPreferencesサービス
- `lib/data/local/local_storage.dart` - ローカルストレージ抽象化
- `lib/data/local/user_settings_storage.dart` - ユーザー設定ストレージ
- `lib/data/repositories/user_repository.dart` - ユーザーデータ管理
- `lib/data/repositories/group_repository.dart` - グループデータ管理

**説明**:
- SharedPreferencesを使用したローカルデータ保存
- ユーザー情報、グループ情報、設定情報をローカルに保存
- オフラインでもデータにアクセス可能

---

## C. Bluetooth実装の技術詳細

### 1. 使用しているBluetoothライブラリ名とバージョン
- **ライブラリ**: `flutter_blue_plus: ^1.32.5`
- **説明**: Flutter用のBluetooth Low Energy (BLE) ライブラリ

### 2. Bluetooth Meshの実装方法
- **実装方法**: 独自実装（`flutter_blue_plus`を基盤として使用）
- **ファイル**: `lib/features/offline_comm/services/bluetooth_mesh_service.dart`
- **現状**: 構造のみ実装済み、実際の通信ロジックはTODO

### 3. 通信範囲・接続可能台数の実測値
- **設計値**: 半径50m以内
- **実測値**: 未測定（実装中）
- **接続可能台数**: 未実装（設計中）

### 4. iOS/Androidでの実装の違いや制約
- **Android**: `flutter_blue_plus`が完全対応
- **iOS**: `flutter_blue_plus`が対応（iOS 13.0以上）
- **Web**: Bluetooth機能は未対応（Web版では動作しない）
- **制約**: 
  - iOSではBluetooth使用時にInfo.plistに説明文が必要
  - Androidでは位置情報権限が必要（Bluetoothスキャンに必要）

### 5. バッテリー消費への配慮
- **現状**: 未実装（設計中）
- **計画**: 
  - バックグラウンドでのスキャン間隔を調整
  - 接続タイムアウトの設定
  - バッテリー残量の監視と警告表示

---

## D. データ管理・状態管理の実装方法

### 1. 状態管理手法
- **使用ライブラリ**: **Riverpod** (`flutter_riverpod: ^2.6.1`)
- **コード生成**: `riverpod_annotation`と`riverpod_generator`を使用
- **実装パターン**: 
  - `@riverpod`アノテーションによるプロバイダー生成
  - `ConsumerWidget`/`ConsumerStatefulWidget`による状態購読
  - `ref.watch()`による状態監視、`ref.read()`による状態更新

**主要プロバイダーファイル**:
- `lib/features/emergency/presentation/providers/emergency_preparedness_provider.dart`
- `lib/features/emergency/presentation/providers/emergency_provider.dart`
- `lib/features/group/presentation/providers/group_provider.dart`
- `lib/features/map/presentation/providers/map_provider.dart`
- `lib/features/offline_comm/presentation/providers/bluetooth_provider.dart`
- `lib/features/onboarding/presentation/providers/onboarding_provider.dart`

### 2. ローカルデータベース
- **使用技術**: **SharedPreferences** (`shared_preferences: ^2.3.3`)
- **データベース**: SQLiteやHiveは使用していない
- **保存データ**:
  - ユーザー情報
  - グループ情報
  - ユーザー設定
  - オンボーディング完了フラグ

**主要ファイル**:
- `lib/data/local/shared_preferences_service.dart` - SharedPreferencesサービス
- `lib/data/local/local_storage.dart` - ローカルストレージ抽象化
- `lib/data/local/user_settings_storage.dart` - ユーザー設定ストレージ

### 3. オフラインデータのキャッシュ戦略
- **現状**: SharedPreferencesによる永続化
- **計画**: 
  - オフラインマップタイルのキャッシュ（未実装）
  - GTFSデータのキャッシュ（未実装）
  - 災害情報のキャッシュ（未実装）

### 4. GTFSデータの取得・更新方法
- **現状**: 構造のみ実装済み（TODO）
- **ファイル**: `lib/features/map/data/gtfs_service.dart`
- **計画**: 
  - GTFSデータのHTTP取得
  - ローカルキャッシュ
  - 定期的な更新

### 5. GISデータの管理方法
- **地図データ**: OpenStreetMapタイルを使用（オンライン）
- **避難所データ**: 座標データをハードコード（今後はAPI連携予定）
- **計画**: 
  - 避難所位置情報のAPI連携
  - オフラインマップタイルのダウンロード機能

---

## E. パフォーマンス指標

### 1. コード行数（概算）
- **Dartファイル数**: 74ファイル（生成ファイル除く）
- **コード行数**: **約5,915行**（生成ファイル除く）
  - 主要ファイルのみ: 約5,915行
  - 生成ファイル（.g.dart, .freezed.dart）: 約2,000行以上（推定）

**主要ファイルの行数**:
- `lib/features/info/presentation/pages/info_page.dart`: 約400行
- `lib/features/communication/presentation/pages/chat_room_page.dart`: 約300行
- `lib/features/map/presentation/pages/map_page.dart`: 約300行
- `lib/features/communication/presentation/pages/radar_page.dart`: 約400行

### 2. テストカバレッジ
- **現状**: テストファイルは未実装
- **テストファイル**: `test/widget_test.dart`（デフォルトのみ）

### 3. ビルドサイズ（APK/IPA）
- **現状**: 未測定
- **推定**: 
  - Android APK: 約20-30MB（リリースビルド）
  - iOS IPA: 約20-30MB（リリースビルド）

### 4. 起動時間
- **現状**: 未測定
- **推定**: 1-2秒（通常のFlutterアプリと同等）

### 5. メモリ使用量
- **現状**: 未測定
- **推定**: 50-100MB（通常のFlutterアプリと同等）

---

## F. 開発進捗とマイルストーン

### 1. 開発開始時期
- **確認事項**: 開発開始時期を教えてください

### 2. 現在の開発フェーズ
- **フェーズ**: **UI実装完了、バックエンド実装中**
- **完了**: 
  - ✅ 全画面のUI実装
  - ✅ ルーティング設定
  - ✅ データモデル定義
  - ✅ 状態管理実装
  - ✅ ローカルデータ保存
- **進行中**: 
  - 🔄 Bluetooth Mesh通信の実装
  - 🔄 実際のBluetoothデバイス検索・通信
- **未実装**: 
  - 📋 GTFSデータの取得・表示
  - 📋 オフラインマップのダウンロード
  - 📋 メッセージの自動翻訳
  - 📋 実際の災害情報APIとの連携

### 3. 次のマイルストーン
1. **Bluetooth Mesh通信の完全実装**（最優先）
2. **オフラインマップのダウンロード機能**
3. **実際の災害情報APIとの連携**
4. **メッセージの自動翻訳機能**
5. **位置情報のリアルタイム更新**

### 4. 技術的課題と解決状況

#### 課題1: Bluetooth Mesh通信の実装
- **状況**: 構造のみ実装済み、実際の通信ロジックは未実装
- **解決策**: `flutter_blue_plus`を使用して実装予定
- **進捗**: 設計完了、実装中

#### 課題2: オフラインマップのダウンロード
- **状況**: 構造のみ実装済み
- **解決策**: 地図タイルの事前ダウンロード機能を実装予定
- **進捗**: 設計中

#### 課題3: 多言語対応の完全実装
- **状況**: UI構造は実装済み、翻訳機能は未実装
- **解決策**: 翻訳APIまたはローカル翻訳辞書の実装
- **進捗**: 設計中

#### 課題4: Web版でのBluetooth機能制限
- **状況**: Web版ではBluetooth機能が動作しない
- **解決策**: Web版ではUIのみ表示、モバイル版で完全機能
- **進捗**: 対応済み（Web版では機能を無効化）

---

## 補足情報

### データモデル一覧（19モデル）
1. `UserModel` - ユーザー情報
2. `GroupModel` - グループ情報
3. `ChatRoomModel` - チャットルーム情報
4. `ChatMessageModel` - チャットメッセージ情報
5. `NearbyUserModel` - 周辺ユーザー情報
6. `EmergencyStatusModel` - 緊急ステータス情報
7. `EvacuationItem` - 持ち出し品情報

### 画面一覧（13画面以上）
1. `OnboardingPage` - オンボーディング
2. `HomePage` - ホーム（タブ切り替え）
3. `InfoPage` - 情報画面
4. `CommunicationPage` - コミュニティ画面
5. `RadarPage` - 周辺ユーザー探索
6. `ChatPage` - チャット一覧
7. `ChatRoomPage` - チャットルーム
8. `ChatBroadcastPage` - 地域掲示板
9. `SafetyPage` - グループ安否確認
10. `ProfilePage` - プロフィール設定
11. `MapPage` - マップ画面
12. `GroupListPage` - グループ一覧
13. `GroupCreatePage` - グループ作成
14. `GroupMemberAddPage` - メンバー追加
15. `EmergencyStatusPage` - 安否ステータス
16. `SosPage` - SOS発信

### カスタムウィジェット一覧（10以上）
1. `CustomBottomNavBar` - カスタムボトムナビゲーションバー
2. `UserAvatarIcon` - ユーザーアバターアイコン
3. `SkillTag` - スキルタグ
4. `LanguageFilterTag` - 言語フィルタータグ
5. `CommMenuCard` - コミュニティメニューカード
6. `CommNotificationCard` - コミュニティ通知カード
7. `InfoColumnCard` - 情報コラムカード
8. `MessageCard` - メッセージカード
9. `MessageBubble` - メッセージバブル
10. `QuickReplyButton` - クイックリプライボタン
11. `UserCard` - ユーザーカード
12. `ChatTypeFilterTag` - チャットタイプフィルタータグ

---

## 確認が必要な項目

1. **開発開始時期**: いつから開発を開始しましたか？
2. **Flutter SDKバージョン**: 実際に使用しているFlutter SDKのバージョン
3. **ビルドサイズ**: APK/IPAの実際のサイズ（測定可能であれば）
4. **パフォーマンス指標**: 起動時間、メモリ使用量などの実測値（測定可能であれば）
5. **使用データセット**: 実際に使用した/使用予定の具体的なデータセット名と提供者名

