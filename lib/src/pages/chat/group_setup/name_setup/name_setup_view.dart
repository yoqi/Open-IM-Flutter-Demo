import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/res/images.dart';
import 'package:openim_demo/src/res/strings.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/avatar_view.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:openim_demo/src/widgets/touch_close_keyboard.dart';

import 'name_setup_logic.dart';

class GroupNameSetupPage extends StatelessWidget {
  final logic = Get.find<GroupNameSetupLogic>();

  @override
  Widget build(BuildContext context) {
    return TouchCloseSoftKeyboard(
      child: Scaffold(
        appBar: EnterpriseTitleBar.back(
          showShadow: false,
          title: "群名称",
          backgroundColor: PageStyle.c_F8F8F8,
          actions: [
            TextButton(
              onPressed: () => logic.modifyGroupName(),
              child: Text(
                StrRes.finished,
                style: TextStyle(
                    color: Color(0xFFFFB300),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        backgroundColor: PageStyle.c_F8F8F8,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text("设置群名称",
                    style: TextStyle(
                        color: Color(0xFF353535),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: TextField(
                    autofocus: true,
                    minLines: 4,
                    maxLines: 5,
                    controller: logic.nameCtrl,
                    style: PageStyle.ts_333333_16sp,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "4/15",
                      style:
                          TextStyle(color: Color(0xFF888888), fontSize: 12.sp),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
