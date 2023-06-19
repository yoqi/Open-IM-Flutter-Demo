import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:openim_demo/src/widgets/touch_close_keyboard.dart';

class SystemMessagePage extends StatelessWidget {
  const SystemMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TouchCloseSoftKeyboard(
        child: Scaffold(
            appBar: EnterpriseTitleBar.back(
              title: "系统消息",
            ),
            body: Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Placeholder(
                          fallbackHeight: 40,
                          fallbackWidth: 40,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "系统消息",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "审核消息",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff999999)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "订单通知",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff999999)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "2021-09-09",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff999999)),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 20,
              ),
            ))));
  }
}
