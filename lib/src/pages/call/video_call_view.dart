import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'video_call_controller.dart';

class VideoCallPage extends StatelessWidget {
  VideoCallPage({Key? key}) : super(key: key);
  final logic = Get.find<VideoCallController>();
  Size get _size => MediaQuery.of(Get.context!).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Image.asset(
            "assets/images/ic_login_bg.webp",
            width: _size.width,
            height: _size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 160,
              child: Container(
                width: _size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "assets/images/iocn_logo_default2.jpg",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
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
                      "视频通话",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 42,
                    ),
                  ],
                ),
              )),
          Positioned(bottom: 122, child: buildBottomView(context))
        ],
      )),
    );
  }

  buildBottomView(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 319,
          height: 80,
          margin: EdgeInsets.only(right: 28, left: 28),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  logic.changeCamera();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Image.asset(
                    "assets/images/voicetelephone-switchcam-button.png",
                    width: 64,
                    height: 64,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  logic.openCamera();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Image.asset(
                    "assets/images/voicetelephone-on-cam-button.png",
                    width: 64,
                    height: 64,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: 319,
          height: 40,
          margin: EdgeInsets.only(right: 28, left: 28),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "前置摄像头",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                "摄像头打开",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          width: 319,
          height: 80,
          margin: EdgeInsets.only(right: 28, left: 28),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Color(0x00000000), Color(0x99000000)]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedPositioned(
                left: -logic.dragDistance,
                duration: Duration(milliseconds: 200),
                child: GestureDetector(
                  onHorizontalDragStart: (details) {
                    // 记录滑动开始时的位置
                    logic.dragStartX = details.globalPosition.dx;
                  },
                  onHorizontalDragUpdate: (details) {
                    // 根据水平滑动距离更新按钮位置
                    logic.dragDistance =
                        (logic.dragStartX - details.globalPosition.dx)
                            .clamp(0, 100); // 最大滑动距离设置为 100 像素
                  },
                  onHorizontalDragEnd: (details) {
                    // 如果滑动距离超过一定阈值，则执行挂断操作
                    if (logic.dragDistance > 30) {
                      logic.dragDistance = 100;
                      logic.isAnswering = false;
                    } else {
                      logic.dragDistance = 0;
                    }
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Image.asset(
                      "assets/images/voicetelephone-hangup-button.png",
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                right: -logic.dragDistance,
                child: GestureDetector(
                  onHorizontalDragStart: (details) {
                    // 记录滑动开始时的位置
                    logic.dragStartX = details.globalPosition.dx;
                  },
                  onHorizontalDragUpdate: (details) {
                    // 根据水平滑动距离更新按钮位置
                    logic.dragDistance =
                        (logic.dragStartX - details.globalPosition.dx)
                            .clamp(0, 100); // 最大滑动距离设置为 100 像素
                  },
                  onHorizontalDragEnd: (details) {
                    // 如果滑动距离超过一定阈值，则执行挂断操作
                    if (logic.dragDistance > 30) {
                      logic.dragDistance = 100;
                      logic.isAnswering = false;
                    } else {
                      logic.dragDistance = 0;
                    }
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Image.asset(
                      "assets/images/voicetelephone-answerthephone-button.png",
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: 319,
          height: 40,
          margin: EdgeInsets.only(right: 28, left: 28),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "接听",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                "挂断",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
