import 'package:flutter/material.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';

/// Description: 举报
/// Time       : 06/01/2023 Thursday
/// Author     : liuyuqi.gov@msn.cn
class JubaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EnterpriseTitleBar.back(
        title: "用户举报",
        backgroundColor: PageStyle.c_F8F8F8,
        showShadow: false,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "举报理由",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "请选择",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Image.asset("assets/images/xx.png"),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text("举报描述"),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "请描述你遇到的问题",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xff888888),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text("0/200"),
            SizedBox(
              height: 18,
            ),
            Text("图片资料(4/8)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            // botton
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                      "assets/images/voicetelephone-answerthephone-button.png"),
                  Image.asset(
                      "assets/images/voicetelephone-answerthephone-button.png"),
                  Image.asset(
                      "assets/images/voicetelephone-answerthephone-button.png"),
                  Image.asset(
                      "assets/images/voicetelephone-answerthephone-button.png"),
                ],
              ),
            ),
            SizedBox(
              height: 78,
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      color: Color(0xffFFB300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "提交",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ]),
        ),
      )),
    );
  }
}
