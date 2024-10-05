
import '../interface/live_danmaku.dart';
import '../model/live_category_result.dart';
import '../model/live_message.dart';
import '../model/live_room_detail.dart';
import '../model/live_search_result.dart';

import '../model/live_category.dart';
import '../model/live_play_quality.dart';
import '../model/live_room_item.dart';

abstract class LiveSite {
  /// 站点唯一ID
  abstract final String id;

  /// 站点名称
  abstract final String name;

  /// 站点名称
  LiveDanmaku getDanmaku();

  /// 读取网站的分类
  Future<List<LiveCategory>> getCategories();

  /// 搜索直播间
  Future<LiveSearchRoomResult> searchRooms(String keyword, {int page = 1});

  /// 搜索直播间
  Future<LiveSearchAnchorResult> searchAnchors(String keyword, {int page = 1});

  /// 读取类目下房间
  Future<LiveCategoryResult> getCategoryRooms(LiveSubCategory category,
      {int page = 1});

  /// 读取推荐的房间
  Future<LiveCategoryResult> getRecommendRooms({int page = 1});

  /// 读取房间详情
  Future<LiveRoomDetail> getRoomDetail({required String roomId});

  /// 读取房间清晰度
  Future<List<LivePlayQuality>> getPlayQualities(
      {required LiveRoomDetail detail});

  /// 读取播放链接
  Future<List<LiveUrlInfo>> getPlayUrls(
      {required LiveRoomDetail detail, required LivePlayQuality quality});

  /// 查询直播状态
  Future<bool> getLiveStatus({required String roomId});

  /// 读取指定房间的SC
  Future<List<LiveSuperChatMessage>> getSuperChatMessage(
      {required String roomId});
}
