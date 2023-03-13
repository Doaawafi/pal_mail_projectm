class Status {
  late int id;
  late String name;
  late String color;
  late String createdAt;
  late String updatedAt;
  late String mailsCount;

  Status(
      {required this.id,
      required this.name,
      required this.color,
      required this.createdAt,
      required this.updatedAt,
      required this.mailsCount});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mailsCount = json['mails_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mails_count'] = this.mailsCount;
    return data;
  }
}
