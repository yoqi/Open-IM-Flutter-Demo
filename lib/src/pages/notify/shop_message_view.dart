import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';
import 'package:openim_demo/src/widgets/touch_close_keyboard.dart';

import '../../res/styles.dart';
import 'shop_message_controller.dart';

class ShopMessagePage extends StatelessWidget {
  ShopMessagePage({Key? key}) : super(key: key);

  final shopMessaegController = Get.find<ShopMessageController>();

  @override
  Widget build(BuildContext context) {
    return TouchCloseSoftKeyboard(
        child: Scaffold(
      appBar: EnterpriseTitleBar.back(
        title: '我的店铺',
        backgroundColor: PageStyle.c_F8F8F8,
        showShadow: false,
      ),
      backgroundColor: PageStyle.c_F8F8F8,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              "订单与系统通知",
              style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            onTap: () {
              shopMessaegController.goToOrderMessage();
            },
            tileColor: Colors.white,
            leading: Image.asset(
              "assets/images/message-service-icon.png",
              height: 48,
              width: 48,
            ),
            title: Text(
              "订单通知",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
            subtitle: Text(
              "顾客 往事随风 已下单并支付成功，请尽快…",
              style: TextStyle(fontSize: 12, color: Color(0xFFABA89D)),
            ),
            trailing: Column(children: [
              Text(
                "刚刚",
                style: TextStyle(fontSize: 12, color: Color(0xFFDBDBDB)),
              ),
              SizedBox(height: 5),
              Container(
                height: 18,
                padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xffEC1010),
                ),
                child: Text(
                  "2",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )
            ]),
          ),
          ListTile(
            onTap: () {
              shopMessaegController.goToSystemMessage();
            },
            tileColor: Colors.white,
            leading: Image.asset(
              "assets/images/message-service-icon.png",
              height: 48,
              width: 48,
            ),
            title: Text(
              "系统通知",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
            subtitle: Text(
              "你的商品【有机五常大米10kg装】被下架…",
              style: TextStyle(fontSize: 12, color: Color(0xFFABA89D)),
            ),
            trailing: Column(
              children: [
                Text(
                  "刚刚",
                  style: TextStyle(fontSize: 12, color: Color(0xFFDBDBDB)),
                ),
                SizedBox(height: 5),
                Container(
                  height: 18,
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
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
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
            child: Text(
              "顾客咨询消息",
              style: TextStyle(fontSize: 12, color: Color(0xffABA89D)),
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            leading: Image.asset(
              "assets/images/message-service-icon.png",
              height: 48,
              width: 48,
            ),
            title: Text(
              "往事随风",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
            subtitle: Text(
              "我已下单成功，能尽快帮我发货吗？",
              style: TextStyle(fontSize: 12, color: Color(0xFFABA89D)),
            ),
            trailing: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1月17日",
                  style: TextStyle(fontSize: 12, color: Color(0xFFDBDBDB)),
                ),
                // SizedBox(height: 5),
                // Container(
                //   height: 18,
                //   padding:
                //       EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(9),
                //     color: Color(0xffEC1010),
                //   ),
                //   child: Text(
                //     "2",
                //     style: TextStyle(fontSize: 12, color: Colors.white),
                //   ),
                // )
              ],
            ),
            onTap: () {
              // shopMessaegController.goToOrderMessage();
            },
          ),
        ],
      ),
    ));
  }
}
