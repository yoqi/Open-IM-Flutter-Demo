import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';


class ShopMessagePage extends StatelessWidget {
  const ShopMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: EnterpriseTitleBar.back(
          title: '我的店铺',
          // backgroundColor: PageStyle.c_F8F8F8,
        ),
        // backgroundColor: PageStyle.c_F8F8F8,
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
        ));
  }
}
