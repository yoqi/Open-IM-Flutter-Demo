import 'package:flutter/material.dart';

/// Description: 举报
/// Time       : 06/01/2023 Thursday
/// Author     : liuyuqi.gov@msn.cn
class JubaoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/back.png"),
        title: Text("用户举报"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40,
          ),
          Text("举报理由"),
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
          Text("图片资料(4/8)"),
          // botton
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/add.png"),
                Image.asset("assets/images/add.png"),
                Image.asset("assets/images/add.png"),
                Image.asset("assets/images/add.png"),
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
                  width: 150,
                  height: 40,
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
      )),
    );
  }
}
