class SystemMessage {
  int type = 1; //1系统消息，2审核消息，3订单通知
  String title = "";
  String content = "";
  String time = "";
  bool showDetail = false;

  SystemMessage(
      this.type, this.title, this.content, this.time, this.showDetail);

  SystemMessage.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    content = json['content'];
    time = json['time'];
    showDetail = json['showDetail'];
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "title": title,
      "content": content,
      "time": time,
      "showDetail": showDetail
    };
  }
}
