class NotificationModel {
  String? notificationType;
  String? title;
  String? text;
  bool? subStatus;

  NotificationModel(
      {this.notificationType, this.title, this.text, this.subStatus});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationType = json['notification_type'];
    title = json['title'];
    text = json['text'];
    subStatus = json['sub_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_type'] = this.notificationType;
    data['title'] = this.title;
    data['text'] = this.text;
    data['sub_status'] = this.subStatus;
    return data;
  }
}
