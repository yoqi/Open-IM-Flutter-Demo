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
  void toInteractionMessage(){
    AppNavigator.startInteractive();
  }
  void toShopMessage(){
    AppNavigator.startShopMessage();
  }

  void toConsultMessage(){
    AppNavigator.startConsultingMessage();
  }
 
  void toSystemMessage(){
    AppNavigator.startSystemMessage();
  }
  void toViewCallRecords() {
    AppNavigator.startCallRecords();
  }
}
