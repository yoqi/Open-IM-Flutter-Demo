import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/core/controller/im_controller.dart';
import 'package:openim_demo/src/pages/mine/mine_logic.dart';
import 'package:openim_demo/src/res/images.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/avatar_view.dart';

class UserInfoPage extends StatelessWidget {
  UserInfoPage({Key? key}) : super(key: key);

  final logic = Get.find<MineLogic>();
  final imLogic = Get.find<IMController>();

  Size get _size => MediaQuery.of(Get.context!).size;

  final List<Tab> tabs = <Tab>[
    Tab(
      text: "作品",
    ),
    Tab(
      text: "点赞",
    ),
    Tab(
      text: "收藏",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageStyle.c_FFFFFF,
      body: Column(
        children: [
          Obx(
            () => Container(
              height: 220.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/userindex-bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 56.h,
                    left: 16,
                    child: Image.asset(
                      "assets/images/icon_back.jpg",
                      width: 28,
                      height: 28,
                    ),
                  ),
                  Positioned(
                    top: 108.h,
                    left: 24,
                    child: AvatarView(
                      size: 59.h,
                      url: imLogic.userInfo.value.faceURL,
                    ),
                  ),
                  Positioned(
                    top: 119.h,
                    left: 99,
                    child: Text(
                      imLogic.userInfo.value.getShowName(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 145.h,
                    left: 99,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => logic.copyID(),
                          child: Text(
                            '七亩地号：${imLogic.userInfo.value.userID}',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => logic.viewMyQrcode(),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageRes.ic_mineQrCode,
                                width: 18.w,
                                height: 18.h,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Image.asset(
                                ImageRes.ic_next,
                                width: 7.w,
                                height: 13.h,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 32,
                      top: 118,
                      child: Image.asset(
                          "assets/images/userindex-chat-button.png")),
                  Positioned(
                      top: 192,
                      child: Container(
                        width: _size.width,
                        height: 204,
                        padding: EdgeInsets.only(top: 24, left: 12, right: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                          ),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                width: _size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "22398",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text("获赞",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFABA89D)))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "22398",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text("粉丝",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFFABA89D))),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "22398",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text("关注",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFABA89D)))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "22398",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text("朋友",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFABA89D)))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ))
                ],
              ),
            ),
          ),
 
          // buildTab()
        ],
      ),
    );
  }

  Widget _buildItemView({
    required String icon,
    required String label,
    Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(icon, width: 22.w, height: 22.h),
              SizedBox(width: 13.w),
              Text(
                label,
                style: PageStyle.ts_333333_16sp,
              ),
              Spacer(),
              Image.asset(ImageRes.ic_next, width: 7.w, height: 13.h),
            ],
          ),
        ),
      );

  Widget buildTab() {
    // three tab:作品，点赞，收藏
    return DefaultTabController(
      length: tabs.length,
      child: Column(children: [
        TabBar(tabs: tabs),
        TabBarView(children: [
          Center(child: Text('This is tab 1')),
          Center(child: Text('This is tab 2')),
          Center(child: Text('This is tab 3')),
        ])
      ]),
    );
  }
}
