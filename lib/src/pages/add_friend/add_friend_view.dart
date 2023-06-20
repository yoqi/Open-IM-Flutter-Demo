import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/res/images.dart';
import 'package:openim_demo/src/res/strings.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/search_box.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';

import 'add_friend_logic.dart';

class AddFriendPage extends StatelessWidget {
  final logic = Get.find<AddFriendLogic>();

  Size get _size => MediaQuery.of(Get.context!).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EnterpriseTitleBar.back(
        title: "添加好友",
        backgroundColor: PageStyle.c_F8F8F8,
        showShadow: false,
      ),
      backgroundColor: PageStyle.c_F8F8F8,
      body: Container(
        width: _size.width,
        height: _size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 9,
            ),
            SearchBox(
              controller: logic.searchCtrl,
              focusNode: logic.focusNode,
              enabled: true,
              autofocus: true,
              margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 22.w),
              // margin: EdgeInsets.fromLTRB(12.w, 0, 0, 0),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              hintText: logic.isSearchUser
                  ? StrRes.searchUserDescribe
                  : StrRes.searchGroupDescribe,
              height: 41.h,
              clearBtn: Container(
                child: Image.asset(
                  ImageRes.ic_clearInput,
                  color: Color(0xFF999999),
                  width: 20.w,
                  height: 20.w,
                ),
              ),
              onSubmitted: (v) => logic.search(),
            ),
            StreamBuilder(
              stream: logic.resultSub.stream,
              builder: (context, AsyncSnapshot<String> sh) {
                if (logic.searchCtrl.text.isNotEmpty && sh.hasData) {
                  if (sh.data!.isNotEmpty) {
                    return _buildResultView(sh.data!);
                  }
                  return _buildNoResultView();
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultView(String id) => Ink(
        height: 59.h,
        color: PageStyle.c_FFFFFF,
        child: InkWell(
          onTap: logic.viewInfo,
          child: Container(
            margin: EdgeInsets.only(top: 16.h),
            padding: EdgeInsets.only(left: 22.w),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: "七亩地号：",
                    style: TextStyle(color: Color(0xFFABA89D), fontSize: 12.sp),
                    children: [
                      TextSpan(
                        text: id,
                        style: TextStyle(
                            color: Color(0xFFABA89D), fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildNoResultView() => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
            ),
            Image.asset(
              "assets/images/nofound.jpg",
              width: 141,
              height: 111,
            ),
            SizedBox(
              height: 38,
            ),
            Text(
              "用户不存在",
              style: TextStyle(color: Color(0xFF969799), fontSize: 14),
            )
          ],
        ),
      );

  Widget _buildItemView({
    required String icon,
    required String title,
    required String desc,
    AlignmentGeometry? alignment,
    Function()? onTap,
  }) =>
      Ink(
        color: PageStyle.c_FFFFFF,
        height: 93.h,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 22.w),
            alignment: alignment,
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 25.w,
                  height: 25.h,
                  color: Color(0xFF206BED),
                ),
                SizedBox(
                  width: 22.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: PageStyle.ts_333333_18sp,
                      ),
                      Text(
                        desc,
                        style: PageStyle.ts_999999_12sp,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  ImageRes.ic_next,
                  width: 16.w,
                  height: 16.h,
                )
              ],
            ),
          ),
        ),
      );
}
