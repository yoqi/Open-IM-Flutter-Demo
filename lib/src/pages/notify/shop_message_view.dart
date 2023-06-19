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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "订单与系统通知",
                style: TextStyle(fontSize: 12, color: Color(0xFFABA89D)),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                leading: Placeholder(),
                title: Text("订单通知"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Placeholder(),
                title: Text("订单通知"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "顾客咨询消息",
                style: TextStyle(fontSize: 12, color: Color(0xFFABA89D)),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                leading: Placeholder(),
                title: Text("订单通知"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          )),
    );
  }
}
