import 'package:flutter/material.dart';
import 'package:flutter_openim_widget/flutter_openim_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/pages/notify/message_controller.dart';
import 'package:openim_demo/src/res/images.dart';
import 'package:openim_demo/src/res/strings.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:openim_demo/src/widgets/touch_close_keyboard.dart';

/// Description: message page
/// Time       : 06/19/2023 Monday
/// Author     : liuyuqi.gov@msn.cn
class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);

  final messageController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return TouchCloseSoftKeyboard(
      child: Scaffold(
          appBar: EnterpriseTitleBar.back(
            title: StrRes.message,
            backgroundColor: PageStyle.c_F8F8F8,
            showShadow: false,
            actions: [
              PopButton(
                popCtrl: messageController.popCtrl,
                menuBgColor: Color(0xB3000000),
                showArrow: true,
                menuBgShadowColor: Color(0xFF000000).withOpacity(0.16),
                menuBgShadowBlurRadius: 6,
                menuBgShadowSpreadRadius: 2,
                menuItemTextStyle: TextStyle(fontSize: 16, color: Colors.white),
                menuItemHeight: 44.h,
                // menuItemWidth: 170.w,
                menuItemPadding: EdgeInsets.only(left: 20.w, right: 30.w),
                menuBgRadius: 6,
                dividingLineColor: Color(0xFF707070),
                dividingLineWidth: 1,
                // menuItemIconSize: 24.h,
                menus: [
                  PopMenuInfo(
                    text: StrRes.addFriend,
                    icon: ImageRes.ic_popAddFriends,
                    onTap: () => messageController.toAddFriend(),
                  ),
                  PopMenuInfo(
                    text: StrRes.addGroup,
                    icon: ImageRes.ic_popAddGroup,
                    onTap: () => messageController.toAddGroup(),
                  ),
                  PopMenuInfo(
                    text: StrRes.scan,
                    icon: ImageRes.ic_popScan,
                    onTap: () => messageController.toScanQrcode(),
                  ),
                ],
                child: TitleImageButton(
                  imageStr: ImageRes.ic_addBlack,
                  imageHeight: 24.h,
                  imageWidth: 23.w,
                  // onTap: (){},
                  // onTap: onClickAddBtn,
                  // height: 50.h,
                ),
              ),
            ],
          ),
          // two layer, one is background, one is content
          body: Stack(children: [
            // Container(
            //   color: Color(0xffFFB300),
            //   child: Column(children: [
            //     Image.asset(
            //       "assets/images/ic_account_setup.webp",
            //       width: 100,
            //       height: 100,
            //     ),
            //     Text("暂无消息"),
            //   ]),
            // ),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     topRight: Radius.circular(20))
                ),
                child: ListView(children: [
                  buildMessageItem(context),
                ]))
          ])),
    );
  }

  // format time
  formatTime(DateTime time) {
    var now = DateTime.now();
    var diff = now.difference(time);
    if (diff.inDays > 365) {
      return "${time.year}年${time.month}月${time.day}日";
    } else if (diff.inDays > 1) {
      return "${time.month}月${time.day}日";
    } else if (diff.inDays == 1) {
      return "昨天";
    } else if (diff.inDays < 1 && diff.inHours > 1) {
      return "${diff.inHours}小时前";
    } else if (diff.inHours == 1) {
      return "1小时前";
    } else if (diff.inHours < 1 && diff.inMinutes >= 1) {
      return "${diff.inMinutes}分钟前";
    } else if (diff.inMinutes < 1) {
      return "刚刚";
    }
  }

  Widget buildNotifyBadge(bool isRead, int count) {
    if (count == 0) {
      return SizedBox.shrink();
    } else if (count < 100) {
      return Positioned(
        top: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "$count",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      );
    } else {
      return Positioned(
        top: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "99+",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      );
    }
  }

  void addFriend(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("添加好友"),
            content: TextField(
              decoration: InputDecoration(
                labelText: "请输入好友账号",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("取消"),
              ),
              TextButton(
                onPressed: () {
                  // todo add friend
                },
                child: Text("确定"),
              ),
            ],
          );
        });
  }

  buildMessageItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "咨询与系统通知",
          style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
        ),
        ListTile(
          onTap: () {
            messageController.toSystemMessage();
          },
          leading: Container(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/message-system-icon.png"),
            ),
          ),
          title: Row(
            children: [
              Text("系统通知"),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffFF0080), Color(0xffFFD500)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text("官方",
                    style: TextStyle(color: Colors.white, fontSize: 10)),
              )
            ],
          ),
          subtitle: Text("747478332333订单已发货"),
          trailing: Column(
            children: [
              Text(
                "刚刚",
                style: TextStyle(fontSize: 12, color: Color(0xffDBDBDB)),
              ),
              SizedBox(height: 5),
              Container(
                height: 18,
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xffEC1010),
                ),
                child: Text(
                  "2",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        ListTile(
          onTap: () {
            messageController.toInteractionMessage();
          },
          leading: Container(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/message-interaction-icon.png"),
            ),
          ),
          title: Text("互动通知"),
          subtitle: Text("往事随风 赞了你的视频",
              style: TextStyle(fontSize: 12, color: Color(0xffABA89D))),
          trailing: Text(
            "刚刚",
            style: TextStyle(fontSize: 12, color: Color(0xffDBDBDB)),
          ),
        ),
        ListTile(
          onTap: () {
            messageController.toShopMessage();
          },
          leading: Container(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/message-shop-icon.png"),
            ),
          ),
          title: Row(
            children: [
              Text(
                "我的店铺",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff006FFF), Color(0xff00C2FF)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text("官方",
                    style: TextStyle(color: Colors.white, fontSize: 10)),
              )
            ],
          ),
          subtitle: Text(
            "心如止水：你好，请问今天能发货吗？",
            style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
          ),
          trailing: Column(
            children: [
              Text("8分钟前",
                  style: TextStyle(fontSize: 12, color: Color(0xffDBDBDB))),
              SizedBox(height: 5),
              Container(
                height: 18,
                width: 30,
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xffEC1010),
                ),
                child: Text(
                  "28",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        ListTile(
          leading: Container(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/message-service-icon.png"),
            ),
          ),
          title: Row(
            children: [
              Text(
                "我的咨询",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff006FFF), Color(0xff00C2FF)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text("官方",
                    style: TextStyle(color: Colors.white, fontSize: 10)),
              )
            ],
          ),
          subtitle: Text(
            "飞牛乳业：已经和仓库备注加急，预计下…",
            style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
          ),
          trailing: Column(
            children: [
              Text("8分钟前",
                  style: TextStyle(fontSize: 12, color: Color(0xffDBDBDB))),
              SizedBox(height: 5),
              Container(
                height: 18,
                width: 30,
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xffEC1010),
                ),
                child: Text(
                  "99+",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        ListTile(
          leading: Container(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/message-newfriends-icon.png"),
            ),
          ),
          title: Row(
            children: [
              Text(
                "新朋友",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff006FFF), Color(0xff00C2FF)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text("官方",
                    style: TextStyle(color: Colors.white, fontSize: 10)),
              )
            ],
          ),
          subtitle: Text(
            "知足常乐 添加你为好友",
            style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
          ),
          trailing: Column(
            children: [
              Text("昨天",
                  style: TextStyle(fontSize: 12, color: Color(0xffDBDBDB))),
              SizedBox(height: 5),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          "聊天互动",
          style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
        ),
        SizedBox(
          height: 8,
        ),
        ListTile(
          leading: Container(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/message-shop-icon.png"),
            ),
          ),
          title: Text(
            "往事随风",
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            "我今晚请你吃农家菜",
            style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
          ),
          trailing: Text("1月17日",
              style: TextStyle(fontSize: 12, color: Color(0xffDBDBDB))),
        ),
        ListTile(
          leading: Container(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/message-shop-icon.png"),
            ),
          ),
          title: Row(
            children: [
              Text(
                "乡村振兴事业群",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          subtitle: Text(
            "往事随风：今晚吃饭，全场我请客，各位…",
            style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
          ),
          trailing: Text("2021年6月2日",
              style: TextStyle(fontSize: 12, color: Color(0xffDBDBDB))),
        ),
        ListTile(
          leading: Container(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/message-shop-icon.png"),
            ),
          ),
          title: Row(
            children: [
              Text(
                "乡村振兴事业群",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          subtitle: Text(
            "往事随风：今晚吃饭，全场我请客，各位…",
            style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
          ),
          trailing: Text("2021年6月2日",
              style: TextStyle(fontSize: 12, color: Color(0xffDBDBDB))),
        ),
      ],
    );
  }
}
