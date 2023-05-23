import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xffFFB300)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // todo add friend
              },
            ),
          ],
          title: Text(
            "消息",
            style: TextStyle(color: Colors.black),
          ),
        ),
        // two layer, one is background, one is content
        body: Stack(children: [
          Container(
            color: Color(0xffFFB300),
            child: Column(children: [
              Image.asset(
                "assets/images/ic_account_setup.webp",
                width: 100,
                height: 100,
              ),
              Text("暂无消息"),
            ]),
          ),
          Container(
              margin: EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(children: [
                buildMessageItem(context),
              ]))
        ]));
  }

  // format time
  formatTime(DateTime time) {
    var now = DateTime.now();
    var diff = now.difference(time);
    if (diff.inDays > 365) {
      return "${time.year}年${time.month}月${time.day}日";
    } else if (diff.inDays > 1) {
      return "${time.month}月${time.day}日";
    } else if (diff.inDays == 1) {
      return "昨天";
    } else if (diff.inDays < 1 && diff.inHours > 1) {
      return "${diff.inHours}小时前";
    } else if (diff.inHours == 1) {
      return "1小时前";
    } else if (diff.inHours < 1 && diff.inMinutes >= 1) {
      return "${diff.inMinutes}分钟前";
    } else if (diff.inMinutes < 1) {
      return "刚刚";
    }
  }

  // build notify badge
  Widget buildNotifyBadge(bool isRead, int count) {
    if (count == 0) {
      return SizedBox.shrink();
    } else if (count < 100) {
      return Positioned(
        top: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "$count",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      );
    } else {
      return Positioned(
        top: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "99+",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      );
    }
  }

  void addFriend(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("添加好友"),
            content: TextField(
              decoration: InputDecoration(
                labelText: "请输入好友账号",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("取消"),
              ),
              TextButton(
                onPressed: () {
                  // todo add friend
                },
                child: Text("确定"),
              ),
            ],
          );
        });
  }

  buildMessageItem(BuildContext context) {
    return Column(
      children: [
        Text("咨询与系统通知"),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/x.png"),
          ),
          title: Row(
            children: [
              Text("系统通知"),
              //  背景颜色渐变 #FF0080-#FFD500
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffFF0080), Color(0xffFFD500)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text("官方",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              )
            ],
          ),
          subtitle: Text("747478332333订单已发货"),
          trailing: Text("刚刚"),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/x.png"),
          ),
          title: Text("互动通知"),
          subtitle: Text("747478332333订单已发货"),
          trailing: Text("刚刚"),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/x.png"),
          ),
          title: Text("我的店铺"),
          subtitle: Text("747478332333订单已发货"),
          trailing: Text("刚刚"),
        ),
        
      ],
    );
  }
}
