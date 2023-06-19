class ConsultingMessage {
  String avatar = "";
  String name = "";
  String message = "";
  int type = 1; //1 商家
  String time = "";
  int unreadCount = 0;

  // ConsultingMessage(
  //     {required this.logo,
  //     required this.title,
  //     required this.content,
  //     required this.time,
  //     required this.unreadCount});

  ConsultingMessage(this.avatar, this.name, this.message, this.time,
      this.unreadCount, this.type);

  ConsultingMessage.fromJson(Map<String, dynamic> json) {
    avatar = json['logo'];
    name = json['title'];
    message = json['content'];
    time = json['time'];
    unreadCount = json['unreadCount'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.avatar;
    data['title'] = this.name;
    data['content'] = this.message;
    data['time'] = this.time;
    data['unreadCount'] = this.unreadCount;
    data['type'] = this.type;
    return data;
  }
}
