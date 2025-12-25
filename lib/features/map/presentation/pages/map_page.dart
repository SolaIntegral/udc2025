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
  bool isDownloading = false;

  // 模擬下載過程
  Future<void> _simulateDownload() async {
    setState(() {
      isDownloading = true;
    });

    // 假裝跑 2 秒鐘進度
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        isDownloading = false;
        isOfflineReady = true; // 狀態變為「已下載」
      });

      // 跳出成功提示 (日文)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("オフラインマップのダウンロードが完了しました"), // 下載完成
          backgroundColor: Colors.green,
        ),
      );
    }
  }

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
    final offlineRegion = [
      LatLng(35.6850, 139.7600), // 左上
      LatLng(35.6850, 139.7680), // 右上
      LatLng(35.6800, 139.7680), // 右下
      LatLng(35.6800, 139.7600), // 左下
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('災害時避難経路'), // 標題：災害時避難路徑
        backgroundColor: isOfflineReady ? Colors.green[700] : Colors.red[800],
        foregroundColor: Colors.white,
        actions: [
          // 右上角的「模擬下載」按鈕
          if (!isOfflineReady)
            IconButton(
              icon: isDownloading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.download_for_offline),
              tooltip: "地図をダウンロード", // 提示：下載地圖
              onPressed: isDownloading ? null : _simulateDownload,
            ),
          if (isOfflineReady)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.check_circle, color: Colors.white),
            ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
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
              if (isOfflineReady)
                PolygonLayer(
                  polygons: [
                    Polygon(
                      points: offlineRegion,
                      color: Colors.green.withOpacity(0.1),
                      borderColor: Colors.green,
                      borderStrokeWidth: 2,
                      isFilled: true,
                    ),
                  ],
                ),

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

          // --- 下方浮動提示 (離線模式) ---
          if (isOfflineReady)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi_off, color: Colors.white, size: 20),
                    SizedBox(width: 10),
                    Text(
                      "オフラインモード起動中", // 顯示：Offline Mode Active
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

