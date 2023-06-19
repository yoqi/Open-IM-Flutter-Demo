import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:openim_demo/src/models/consulting_message.dart';
import 'package:openim_demo/src/res/styles.dart';
import 'package:openim_demo/src/widgets/titlebar.dart';

class ConsultingMessagePage extends StatelessWidget {
  const ConsultingMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ConsultingMessage> messages = [
      ConsultingMessage(
          "https://img2.baidu.com/it/u=2188683610,101725630&fm=26&fmt=auto&gp=0.jpg",
          "飞牛乳业",
          "我已下单成功，能尽快帮我发货吗？",
          "1月17日",
          2,
          1),
      ConsultingMessage(
          "https://img2.baidu.com/it/u=2188683610,101725630&fm=26&fmt=auto&gp=0.jpg",
          "黑龙江精品五常大米",
          "我已下单成功，能尽快帮我发货吗？",
          "1月17日",
          2,
          1),
    ];

    return Scaffold(
      appBar: EnterpriseTitleBar.back(
        title: "我的咨询",
        backgroundColor: PageStyle.c_F8F8F8,
        showShadow: false,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 16,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 48,
                width: 48,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(messages[index].avatar),
                ),
              ),
              title: Container(
                width: 50,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    child: Text(messages[index].name),
                    flex: 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF006FFF), Color(0xFF00C2FF)],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding:
                        EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                    child: Text(
                      "商家",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ]),
              ),
              subtitle: Text(messages[index].message),
              trailing: Text(messages[index].time),
            );
          },
          itemCount: messages.length,
        ),
      ),
    );
  }
}
