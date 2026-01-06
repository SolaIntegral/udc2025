import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// マップ・ナビゲーション画面（緑のヘッダー）
/// オフラインマップ、避難経路、家族の居場所など
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // 模擬「是否已經下載離線地圖」的狀態
  bool isOfflineReady = false;

  @override
  Widget build(BuildContext context) {
    // 1. 起點：東京車站丸之內中央口
    final myLocation = LatLng(35.681406, 139.766173);

    // 2. 終點：和田倉噴水公園 (避難所)
    final shelterLocation = LatLng(35.683500, 139.761000);

    // 3. 真實路徑 (修正後的行幸通傾斜角度)
    final evacuationRoute = [
      myLocation,
      LatLng(35.682200, 139.762700), // 行幸通斜角
      LatLng(35.683400, 139.762700), // 沿護城河
      LatLng(35.683400, 139.762000), // 橋頭
      LatLng(35.683500, 139.761500), // 過橋
      shelterLocation,
    ];

    // 4. 定義「離線區域」的範圍
    // TODO: オフラインマップ機能を実装する際に使用
    // final offlineRegion = [
    //   LatLng(35.6850, 139.7600), // 左上
    //   LatLng(35.6850, 139.7680), // 右上
    //   LatLng(35.6800, 139.7680), // 右下
    //   LatLng(35.6800, 139.7600), // 左下
    // ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFF), // Figmaデザインの背景色
      body: SafeArea(
        child: Stack(
        children: [
          // ヘッダー部分
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              color: const Color(0xFFFDFEFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'マップ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.24,
                    ),
                  ),
                  // ユーザーアイコン（通知ドット付き）
                  Stack(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      // 通知ドット（緑）
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFF00D26A),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // マップエリア（ヘッダーの下から開始）
          Positioned(
            top: 66, // ヘッダーの高さ分
            left: 0,
            right: 0,
            bottom: 0,
            child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(35.6825, 139.7635),
              initialZoom: 16.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.udc.disaster_app',
              ),

              // --- 離線區域框 (下載後顯示) ---
              // TODO: オフラインマップ機能を実装する際に有効化
              // if (isOfflineReady)
              //   PolygonLayer(
              //     polygons: [
              //       Polygon(
              //         points: offlineRegion,
              //         color: Colors.green.withOpacity(0.1),
              //         borderColor: Colors.green,
              //         borderStrokeWidth: 2,
              //         isFilled: true,
              //       ),
              //     ],
              //   ),

              PolylineLayer(
                polylines: [
                  Polyline(
                    points: evacuationRoute,
                    strokeWidth: 10.0,
                    color: Colors.black45,
                    strokeJoin: StrokeJoin.round,
                  ),
                  Polyline(
                    points: evacuationRoute,
                    strokeWidth: 6.0,
                    color: Colors.redAccent,
                    strokeJoin: StrokeJoin.round,
                  ),
                ],
              ),

              MarkerLayer(
                markers: [
                  // --- Start Marker (起點) ---
                  Marker(
                    point: myLocation,
                    width: 140,
                    height: 80,
                    child: Column(
                      children: [
                        const Icon(Icons.directions_run,
                            color: Colors.blue, size: 40),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: const Text("現在地：東京駅",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11)),
                        ),
                      ],
                    ),
                  ),

                  // --- Turn Marker (轉彎提示) ---
                  Marker(
                    point: LatLng(35.683400, 139.762000),
                    width: 80,
                    height: 40,
                    child: const Icon(Icons.subdirectory_arrow_left,
                        color: Colors.black, size: 30),
                  ),

                  // --- Family Marker (家人 - 可點擊互動版) ---
                  // 這裡就是你要的加分功能！
                  Marker(
                    point: shelterLocation, // 假設家人在避難所
                    width: 140,
                    height: 80,
                    child: GestureDetector(
                      onTap: () {
                        // 點擊後彈出底部資訊欄
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250, // 高度稍微拉高一點，容納更多資訊
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("家族のステータス",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const Divider(),
                                  const ListTile(
                                    leading: Icon(Icons.check_circle,
                                        color: Colors.green, size: 40),
                                    title: Text("母 (Mom)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        "避難所に到着しました。無事です。"), // 已抵達避難所，平安
                                    trailing: Text("🔋 85%",
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: ElevatedButton.icon(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(Icons.chat),
                                      label: const Text("メッセージを送る"), // 發送訊息
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Column(
                        children: [
                          // 換成橘色的人像圖標，代表家人
                          const Icon(Icons.people,
                              color: Colors.orange, size: 40),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.orange),
                            ),
                            child: const Text("家族 (タップ)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.deepOrange)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
            ),
          ),

          // 家族ステータスカード（下部に表示）
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: _buildFamilyStatusCard(),
          ),
        ],
        ),
      ),
    );
  }

  /// 家族ステータスカードを構築
  Widget _buildFamilyStatusCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2B3452).withOpacity(0.03),
              offset: const Offset(0, 0),
              blurRadius: 29.8,
              spreadRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // アイコン（緑背景、チェックマーク）
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFEDFFE5),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(13),
              child: const Icon(
                Icons.check_circle,
                color: Color(0xFF00D26A),
                size: 32,
              ),
            ),
            const SizedBox(width: 21),
            // テキスト情報
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 名前と距離・バッテリー情報
                  Row(
                    children: [
                      const Text(
                        '母(mom)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2F3244),
                          letterSpacing: -0.24,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Color(0xFF838383),
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        '26m',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF838383),
                          letterSpacing: -0.24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.battery_5_bar,
                        size: 16,
                        color: Color(0xFF838383),
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        '85%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF838383),
                          letterSpacing: -0.24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // メッセージ
                  const Text(
                    '避難所に到着しました。無事です。',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2F3244),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 21),
            // 右矢印アイコン
            const Icon(
              Icons.chevron_right,
              size: 16,
              color: Color(0xFF838383),
            ),
          ],
        ),
      ),
    );
  }
}
