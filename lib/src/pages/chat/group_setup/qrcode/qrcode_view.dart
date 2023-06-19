import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/res/strings.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/avatar_view.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'qrcode_logic.dart';

class GroupQrcodePage extends StatelessWidget {
  final logic = Get.find<GroupQrcodeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EnterpriseTitleBar.back(
        title: StrRes.groupQrcode,
        showShadow: false,
        backgroundColor: PageStyle.c_F8F8F8,
      ),
      backgroundColor: PageStyle.c_F8F8F8,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 58.h),
              width: 339.w,
              height: 490.h,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/crowd-qrcode-bg.png",
                    width: 339,
                    height: 490,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 31.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AvatarView(
                            size: 58.h,
                            url: logic.info.faceURL,
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                logic.info.groupName ?? '',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF353535),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "下载【七亩地】APP，扫码加入群聊",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF353535),
                                    fontWeight: FontWeight.w500),
                              )
                              // 富文本
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 180.h,
                      height: 180.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFAAF7D9),
                            Color(0xFF5496E4),
                          ],
                        ),
                      ),
                      child: QrImage(
                        data: logic.buildQRContent(),
                        size: 176.h,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("保存图片"),
                        content: Text("是否保存图片到相册？"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("取消")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                logic.saveQrcode();
                              },
                              child: Text("确定")),
                        ],
                      ));
            },
            child: Container(
              height: 60,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
              decoration: BoxDecoration(
                  color: Color(0xFFFFB300),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "保存图片",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
