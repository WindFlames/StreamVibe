import 'dart:convert';

class LivePlayQuality {
  /// 清晰度
  final String quality;

  /// 清晰度信息
  final dynamic data;

  final int sort;
  final bool hevc;
  LivePlayQuality({
    required this.quality,
    required this.data,
    this.sort = 0,
    this.hevc = false,
  });

  @override
  String toString() {
    return json.encode({
      "quality": quality,
      "data": data.toString(),
    });
  }
}

class LiveUrlInfo {
  final String url;
  final bool isH265;
  LiveUrlInfo({required this.url, this.isH265 = false});
}
