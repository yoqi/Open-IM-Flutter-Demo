import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:openim_demo/src/widgets/touch_close_keyboard.dart';

class SystemMessageController extends GetxController {
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
    // AppNavigator.startAddFriend();
  }
  void toAddGroup() {
    // AppNavigator.startAddGroupBySearch();
  }
  void createGroup() {
    // AppNavigator.createGroup();
  }
  void toScanQrcode() {
    // AppNavigator.startScanQrcode();
  }
  void toInteractionMessage() {
    // AppNavigator.startInteractive();
  }
  void toShopMessage() {
    // AppNavigator.startShopMessage();
  }
  void toSystemMessage() {
    // AppNavigator.startSystemMessage();
  }
  void toViewCallRecords() {
    // AppNavigator.startCallRecords();
  }
}
