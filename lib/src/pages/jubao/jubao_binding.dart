import 'jubao_controller.dart';
import 'package:get/get.dart';

class JubaoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JubaoController>(() => JubaoController());
  }
}
