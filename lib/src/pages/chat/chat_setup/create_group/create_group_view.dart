import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/models/contacts_info.dart';
import 'package:openim_demo/src/res/images.dart';
import 'package:openim_demo/src/res/strings.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/debounce_button.dart';
import 'package:openim_demo/src/widgets/avatar_view.dart';
import 'package:openim_demo/src/widgets/image_button.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:openim_demo/src/widgets/touch_close_keyboard.dart';
import 'package:sprintf/sprintf.dart';

import 'create_group_logic.dart';

class CreateGroupInChatSetupPage extends StatelessWidget {
  final logic = Get.find<CreateGroupInChatSetupLogic>();

  @override
  Widget build(BuildContext context) {
    return TouchCloseSoftKeyboard(
      child: Scaffold(
        backgroundColor: PageStyle.c_F8F8F8,
        appBar: EnterpriseTitleBar.back(
          title: StrRes.launchGroup,
          backgroundColor: PageStyle.c_F8F8F8,
          showShadow: false,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  "群名称*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF353535),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 12,
                ),
                _buildGroupInfoView(),
                Text(
                  "添加群成员*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF353535),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 12,
                ),
                _buildGroupMemberView(),
                Spacer(),
                _buildButton(),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGroupInfoView() => Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
        color: PageStyle.c_FFFFFF,
        child: Row(
          children: [
            // Obx(() => logic.avatarUrl.value.isNotEmpty
            //     ? AvatarView(
            //         url: logic.avatarUrl.value,
            //         size: 44.h,
            //       )
            //     : ImageButton(
            //         onTap: () => logic.setAvatar(),
            //         imgStrRes: ImageRes.ic_uploadPhoto,
            //         imgWidth: 44.h,
            //         imgHeight: 44.h,
            //       )),
            // SizedBox(
            //   width: 20.w,
            // ),
            Expanded(
              child: TextField(
                controller: logic.nameCtrl,
                decoration: InputDecoration(
                  hintText: StrRes.createGroupNameHint,
                  hintStyle: PageStyle.ts_999999_16sp,
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildGroupMemberView() => Obx(() => Container(
        height: 100.h,
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Text(
            //       StrRes.groupMember,
            //       style: PageStyle.ts_999999_14sp,
            //     ),
            //     Spacer(),
            //     Text(
            //       sprintf(StrRes.xPerson, [logic.memberList.length]),
            //       style: PageStyle.ts_999999_14sp,
            //     ),
            //     SizedBox(
            //       width: 4.w,
            //     ),
            //     Image.asset(
            //       ImageRes.ic_next,
            //       width: 8.w,
            //       height: 14.h,
            //     ),
            //   ],
            // ),
            Expanded(
              child: GridView.builder(
                itemCount: logic.length(),
                // padding: EdgeInsets.zero,
                padding: EdgeInsets.only(top: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (_, index) {
                  return logic.itemBuilder(
                    index: index,
                    builder: (info) => _buildItemView(info),
                    addButton: () => _buildItemView2(
                      imgStrRes: ImageRes.ic_memberAdd,
                    ),
                    delButton: () => _buildItemView2(
                      imgStrRes: ImageRes.ic_memberDel,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ));

  Widget _buildItemView(ContactsInfo info) => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AvatarView(
              size: 40.h,
              url: info.faceURL,
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              width: 50.w,
              alignment: Alignment.center,
              child: Text(
                info.getShowName(),
                style: PageStyle.ts_999999_12sp,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      );

  Widget _buildItemView2({required String imgStrRes}) => Container(
        child: Column(
          children: [
            Image.asset(
              imgStrRes,
              width: 40.h,
              height: 40.h,
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              '',
              style: PageStyle.ts_999999_12sp,
            )
          ],
        ),
      );

  Widget _buildButton() => DebounceButton(
        onTap: () async => await logic.completeCreation(),
        builder: (context, onTap) {
          return Ink(
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.5.h),
                  color: Color(0xFFFFB300),
                ),
                alignment: Alignment.center,
                child: Text(
                  "创建群聊",
                  style: PageStyle.ts_FFFFFF_18sp,
                ),
              ),
            ),
          );
        },
      );
// Widget _buildButton() => Ink(
//       color: PageStyle.c_1B72EC,
//       height: 45.h,
//       child: InkWell(
//         onTap: () => logic.completeCreation(),
//         child: Container(
//           alignment: Alignment.center,
//           child: Text(
//             StrRes.completeCreation,
//             style: PageStyle.ts_FFFFFF_18sp,
//           ),
//         ),
//       ),
//     );
}
