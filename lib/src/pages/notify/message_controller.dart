import 'package:flutter_openim_widget/flutter_openim_widget.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/routes/app_navigator.dart';

class MessageController extends GetxController {
  var popCtrl = CustomPopupMenuController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toAddFriend() {
    AppNavigator.startAddFriend();
  }

  void toAddGroup() {
    AppNavigator.startAddGroupBySearch();
  }

  void createGroup() {
    AppNavigator.createGroup();
  }

  void toScanQrcode() {
    AppNavigator.startScanQrcode();
  }

  void toViewCallRecords() {
    AppNavigator.startCallRecords();
  }

  /// 清空未读消息数
  void _markMessageHasRead({String? uid, String? gid, int? unreadCount}) {
    if (unreadCount != null && unreadCount > 0) {
      if (uid != null && uid.isBlank == false) {
        // OpenIM.iMManager.conversationManager.markSingleMessageHasRead(
        //   userID: uid,
        // );
        OpenIM.iMManager.messageManager.markC2CMessageAsRead(
          userID: uid,
          messageIDList: [],
        );
      } else {
        OpenIM.iMManager.conversationManager.markGroupMessageHasRead(
          groupID: gid!,
        );
      }
    }
  }

  /// 设置草稿
  void _setupDraftText({
    required String conversationID,
    required String oldDraftText,
    required String newDraftText,
  }) {
    if (oldDraftText.isEmpty && newDraftText.isEmpty) {
      return;
    }

    /// 保存草稿
    print('draftText:$newDraftText');
    OpenIM.iMManager.conversationManager.setConversationDraft(
      conversationID: conversationID,
      draftText: newDraftText,
    );
  }
}
