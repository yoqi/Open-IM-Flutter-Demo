import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/pages/call/call_logic.dart';

/// Description: call page
/// Time       : 05/30/2023 Tuesday
/// Author     : liuyuqi.gov@msn.cn
class CallPage extends StatelessWidget {
  CallPage({Key? key}) : super(key: key);

  final logic = Get.find<CallLogic>();
  Size get _size => MediaQuery.of(Get.context!).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => WillPopScope(
          onWillPop: logic.multiSelMode.value ? () async => logic.exit() : null,
          child: Container(
            child: Stack(
              children: [
                Image.asset("assets/images/"),
                Positioned(
                    child: Column(
                  children: [
                    Image.asset(
                      "assets/images/xx.og",
                      width: 120,
                      height: 120,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "往事随风",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "语音通话",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                )),
              ],
            ),
          ))),
    );
  }
}
