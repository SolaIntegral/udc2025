import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

/// 地図プロバイダー
@riverpod
class MapState extends _$MapState {
  @override
  MapStateData build() {
    return MapStateData(
      latitude: 35.6812,
      longitude: 139.7671,
      zoom: 13.0,
    );
  }

  /// 地図の位置を更新
  void updatePosition(double latitude, double longitude) {
    state = state.copyWith(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

/// 地図の状態データ
class MapStateData {
  final double latitude;
  final double longitude;
  final double zoom;

  MapStateData({
    required this.latitude,
    required this.longitude,
    required this.zoom,
  });

  MapStateData copyWith({
    double? latitude,
    double? longitude,
    double? zoom,
  }) {
    return MapStateData(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      zoom: zoom ?? this.zoom,
    );
  }
}

