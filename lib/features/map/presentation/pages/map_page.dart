import 'package:flutter/material.dart';

/// 地図ページ
/// GTFS表示・避難所マーカー表示
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('地図'),
      ),
      body: const Center(
        child: Text('地図ページ'),
      ),
    );
  }
}

