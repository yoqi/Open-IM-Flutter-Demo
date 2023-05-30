import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>WillPopScope(
        onWillPop: logic.multiSelMode.value ? () async => logic.exit() : null,
        child: Text("s")
      )),
    );
  }
}