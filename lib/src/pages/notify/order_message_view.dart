import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:openim_demo/src/models/system_messsage.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:openim_demo/src/widgets/touch_close_keyboard.dart';

class OrderMessagePage extends StatelessWidget {
  const OrderMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SystemMessage> systemMessage = [
      SystemMessage(
          1, "订单消息", "你的订单【有机五常大米10kg装】已发货，请注意查收。", "2017年7月7日 07:07", true),
      SystemMessage(
          2, "订单消息", "你的订单【有机五常大米10kg装】已发货，请注意查收。", "2017年7月7日 07:07", true),
      SystemMessage(
          3, "订单消息", "你的订单【有机五常大米10kg装】已发货，请注意查收。", "2017年7月7日 07:07", true),
      SystemMessage(
          3, "订单消息", "你的订单【有机五常大米10kg装】已发货，请注意查收。", "2017年7月7日 07:07", true),
    ];

    return TouchCloseSoftKeyboard(
        child: Scaffold(
            appBar: EnterpriseTitleBar.back(
              title: "订单通知",
              backgroundColor: PageStyle.c_F8F8F8,
              showShadow: false,
            ),
            body: Container(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        systemMessage[index].time,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFDBDBDB)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/message-examine-icon.png",
                                  height: 24,
                                  width: 24,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  systemMessage[index].title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              height: 1,
                              color: Color(0xFFF2F2F2),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              systemMessage[index].content,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff999999)),
                            ),
                            if (systemMessage[index].showDetail)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "点击查看",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFFFFB300)),
                                  ),
                                  Icon(Icons.arrow_right_sharp)
                                ],
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: systemMessage.length,
            ))));
  }
}
