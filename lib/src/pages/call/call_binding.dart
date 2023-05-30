import 'package:get/get.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallLogic());
  }
}