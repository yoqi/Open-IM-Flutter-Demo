import 'package:get/get.dart';
import 'package:openim_demo/src/routes/app_navigator.dart';
import 'package:openim_demo/src/routes/app_pages.dart';


class ShopMessageController extends GetxController {
  static ShopMessageController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void goToOrderMessage() {
     AppNavigator.startOrderMessage();
  }
}