import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:openim_demo/src/widgets/touch_close_keyboard.dart';

/// Description: interactive page
/// Time       : 06/19/2023 Monday
/// Author     : liuyuqi.gov@msn.cn
class InteractivePage extends StatelessWidget {
  const InteractivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TouchCloseSoftKeyboard(
            child: Scaffold(
          appBar: EnterpriseTitleBar.back(
            title: "互动通知",
            backgroundColor: PageStyle.c_F8F8F8,
            showShadow: false,
          ),
          backgroundColor: PageStyle.c_F8F8F8,
          body: Column(
            children: [
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/message-interaction-icon.png"),
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
                leading: Container(
                  width: 48,
                  height: 48,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/message-interaction-icon.png"),
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
                leading: Container(
                  width: 48,
                  height: 48,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/message-interaction-icon.png"),
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
                leading: Container(
                  width: 48,
                  height: 48,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/message-interaction-icon.png"),
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
            ],
          ),
        )));
  }
}
