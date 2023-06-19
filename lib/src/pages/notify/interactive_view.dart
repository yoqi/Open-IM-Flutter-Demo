import 'package:flutter/material.dart';
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
    return TouchCloseSoftKeyboard(
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
                  title: Text("往事随风"),
                  subtitle: Text("赞了你的视频",
                      style: TextStyle(fontSize: 12, color: Color(0xffABA89D))),
                  trailing: Container(
                    width: 100,
                    height: 48,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "1月17日",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffDBDBDB)),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset(
                            "assets/images/userindex-bg.png",
                            width: 36,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ]),
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
                  title: Text("往事随风"),
                  subtitle: Text("评论了你：这风景太美了吧！有空带我去…",
                      style: TextStyle(fontSize: 12, color: Color(0xffABA89D))),
                  trailing: Container(
                    width: 100,
                    height: 48,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "1月17日",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffDBDBDB)),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset(
                            "assets/images/userindex-bg.png",
                            width: 36,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ]),
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
                  subtitle: Text("回复了你：好的，我会跟上你的",
                      style: TextStyle(fontSize: 12, color: Color(0xffABA89D))),
                  trailing: Container(
                    width: 100,
                    height: 48,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "1月17日",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffDBDBDB)),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset(
                            "assets/images/userindex-bg.png",
                            width: 36,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ]),
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
                  title: Text(
                    "往事随风",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  subtitle: Text("关注了你",
                      style: TextStyle(fontSize: 12, color: Color(0xffABA89D))),
                  trailing: Container(
                    width: 200,
                    height: 48,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "1月17日",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffDBDBDB)),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              // todo
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFB300),
                                  borderRadius: BorderRadius.circular(16)),
                              padding: EdgeInsets.only(
                                  left: 12, top: 8, right: 12, bottom: 8),
                              child: Text(
                                "回关",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            )));
  }
}
