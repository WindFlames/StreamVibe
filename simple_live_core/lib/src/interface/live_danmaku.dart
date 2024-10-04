import 'dart:async';

import 'package:simple_live_core/src/model/live_message.dart';

abstract class LiveDanmaku {
  abstract Function(LiveMessage msg)? onMessage;
  abstract Function(String msg)? onClose;
  abstract Function()? onReady;

  /// 心跳时间
  abstract int heartbeatTime ;

  /// 发生心跳
  void heartbeat();

  /// 开始接收信息
  Future start(dynamic args) ;

  /// 停止接收信息
  Future stop() ;
}
