import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/res/images.dart';
import 'package:openim_demo/src/res/strings.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/avatar_view.dart';
import 'package:openim_demo/src/widgets/image_button.dart';
import 'package:openim_demo/src/widgets/switch_button.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';

import 'group_setup_logic.dart';

class GroupSetupPage extends StatelessWidget {
  final logic = Get.find<GroupSetupLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageStyle.c_F6F6F6,
      appBar: EnterpriseTitleBar.back(
        title: "群信息",
        backgroundColor: PageStyle.c_F8F8F8,
        showShadow: false,
      ),
      body: SafeArea(
        child: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  _buildGroupMemberView(),
                  Container(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // _buildGroupInfoView(),
                        SizedBox(height: 24.h),
                        Text(
                          "群名称",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        _buildItemView(
                          label: logic.info.value.groupName ?? "",
                          value: "",
                          showArrow: true,
                          onTap: () => logic.modifyGroupName(),
                        ),
                        // _buildItemView(
                        //   label: StrRes.groupAnnouncement,
                        //   showArrow: true,
                        //   onTap: () => logic.editGroupAnnouncement(),
                        // ),
                        SizedBox(height: 18.h),
                        Text(
                          "聊天内容",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 12.h),
                        _buildItemView(
                          label: StrRes.seeChatHistory,
                          showArrow: true,
                          onTap: () {},
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          "更多功能",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 12.h),
                        _buildItemView(
                          label: StrRes.groupQrcode,
                          showArrow: true,
                          showQrcodeIcon: true,
                          onTap: () => logic.viewGroupQrcode(),
                        ),
                        SizedBox(height: 8.h),
                        if (logic.isMyGroup())
                          _buildItemView(
                            label: StrRes.groupPermissionTransfer,
                            showArrow: true,
                            onTap: () => logic.transferGroup(),
                          ),
                        // _buildItemView(
                        //   label: StrRes.myNicknameInGroup,
                        //   showArrow: true,
                        //   onTap: () => logic.modifyMyGroupNickname(),
                        // ),

                        SizedBox(height: 12.h),
                        // _buildItemView(
                        //   label: StrRes.groupIDCode,
                        //   showArrow: true,
                        //   onTap: () => logic.copyGroupID(),
                        // ),

                        // _buildItemView(
                        //   label: StrRes.notDisturb,
                        //   showSwitchBtn: true,
                        //   on: logic.noDisturb.value,
                        //   onClickSwitchBtn: logic.toggleNotDisturb,
                        // ),
                        // if (logic.noDisturb.value)
                        //   _buildItemView(
                        //     label: StrRes.groupMessageSettings,
                        //     showArrow: true,
                        //     value: logic.noDisturbIndex.value == 0
                        //         ? StrRes.receiveMessageButNotPrompt
                        //         : StrRes.blockGroupMessages,
                        //     onTap: logic.noDisturbSetting,
                        //   ),
                        // _buildItemView(
                        //   label: StrRes.chatTop,
                        //   showSwitchBtn: true,
                        //   on: logic.topContacts.value,
                        //   onClickSwitchBtn: () => logic.toggleTopContacts(),
                        // ),
                        _buildItemView(
                          label: StrRes.clearHistory,
                          showArrow: true,
                          onTap: () => logic.clearChatHistory(),
                        ),
                        SizedBox(height: 12.h),
                        // _buildItemView(
                        //   label: StrRes.complaint,
                        //   showArrow: true,
                        //   onTap: () {},
                        // ),
                        SizedBox(height: 63.h),
                        _buildButton(),
                        SizedBox(height: 8.h),
                        if (logic.isMyGroup()) _buildDissolveGroupButton(),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            )),
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
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: logic.isMyGroup() ? () => logic.modifyAvatar() : null,
              child: Container(
                width: 48.h,
                height: 48.h,
                child: Stack(
                  children: [
                    if (logic.info.value.faceURL != null &&
                        logic.info.value.faceURL!.isNotEmpty)
                      AvatarView(
                        size: 48.h,
                        url: logic.info.value.faceURL,
                      ),
                    if (logic.info.value.faceURL == null ||
                        logic.info.value.faceURL!.isEmpty)
                      ImageButton(
                        imgStrRes: ImageRes.ic_uploadPhoto,
                        imgWidth: 48.h,
                        imgHeight: 48.h,
                      ),
                    Visibility(
                      visible: logic.isMyGroup(),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: PageStyle.c_1D6BED,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: PageStyle.c_FFFFFF,
                            size: 10.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Text(
                '${logic.info.value.groupName}（${logic.info.value.memberCount}）',
                style: PageStyle.ts_333333_18sp,
              ),
            )
          ],
        ),
      );

  Widget _buildGroupMemberView() => Ink(
        height: 98.h,
        // color: PageStyle.c_FFFFFF,
        // decoration: BoxDecoration(
        //   color: PageStyle.c_FFFFFF,
        //   boxShadow: [
        //     BoxShadow(
        //       color: PageStyle.c_000000_opacity10p,
        //       blurRadius: 4,
        //       offset: Offset(0, 2.h),
        //     ),
        //   ],
        // ),
        child: InkWell(
          onTap: () => logic.viewGroupMembers(),
          child: Container(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 14.h,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: logic.length(),
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 13.w,
                        mainAxisSpacing: 14.h,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (_, index) {
                        return logic.itemBuilder(
                          index: index,
                          builder: (info) => Container(
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                  child: AvatarView(
                                    size: 40.h,
                                    url: info.faceURL,
                                  ),
                                ),
                                Text(
                                  info.nickname ?? "",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFFABA89D)),
                                )
                              ],
                            ),
                          ),
                          delButton: () => Center(
                            child: Image.asset(
                              "assets/images/crowd-del-member-button.png",
                              width: 40.h,
                              height: 40.h,
                            ),
                          ),
                          addButton: () => Center(
                            child: Image.asset(
                              "assets/images/crowd-add-member-button.png",
                              width: 40.h,
                              height: 40.h,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildItemView({
    required String label,
    String? value,
    Function()? onTap,
    Function()? onClickSwitchBtn,
    bool on = true,
    bool showQrcodeIcon = false,
    bool showArrow = false,
    bool showSwitchBtn = false,
  }) =>
      Ink(
        height: 50.h,
        decoration: BoxDecoration(
          color: PageStyle.c_FFFFFF,
          border: BorderDirectional(
            bottom: BorderSide(
              color: PageStyle.c_999999_opacity40p,
              width: 0.5,
            ),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: PageStyle.ts_333333_16sp,
                  ),
                ),
                if (null != value)
                  Text(
                    value,
                    style: PageStyle.ts_999999_14sp,
                  ),
                if (showQrcodeIcon)
                  Image.asset(
                    ImageRes.ic_mineQrCode,
                    width: 18.w,
                    height: 18.h,
                    color: PageStyle.c_999999,
                  ),
                if (showArrow)
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: Image.asset(
                      ImageRes.ic_next,
                      width: 10.w,
                      height: 17.h,
                      color: PageStyle.c_999999,
                    ),
                  ),
                if (showSwitchBtn)
                  SwitchButton(
                    onTap: onClickSwitchBtn,
                    on: on,
                  )
              ],
            ),
          ),
        ),
      );

  Widget _buildButton() => Ink(
        child: InkWell(
          onTap: () => logic.quitGroup(),
          child: Container(
            height: 60,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: Colors.white),
            child: Text(
              StrRes.quitGroup,
              style: TextStyle(fontSize: 18, color: Color(0xFFEC1010)),
            ),
          ),
        ),
      );
}

Widget _buildDissolveGroupButton() {
  return Ink(
    child: InkWell(
      // onTap: () => logic.dissolveGroup(),
      child: Container(
        height: 60,
        padding: EdgeInsets.only(top: 5, bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60), color: Colors.white),
        child: Text(
          "解散该群",
          style: TextStyle(fontSize: 18, color: Color(0xFFEC1010)),
        ),
      ),
    ),
  );
}
