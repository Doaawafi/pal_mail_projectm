import 'package:flutter/foundation.dart';
import 'package:pal_mail_project/model/tags.dart';

import 'mail.dart';

class Sender {
  String? name;
  String? mobile;
  String? address;
  String? catId;
}

class SenderData {
  int? id;
  String? name;
  String? mobile;
  String? address;
  String? category_id;
  String? cretaed_at;
  String? update_at;
  String? mails_count;
  List<Category>? category;
  List<Mail>? mailList;
  List<Tags>? tagsList;
  List? attachmentList;
  List? activitiesList;

  SenderData(
      {this.id,
      this.name,
      this.mobile,
      this.address,
      this.category_id,
      this.cretaed_at,
      this.update_at,
      this.category,
      this.mails_count,
      this.mailList,
      this.attachmentList,
      this.activitiesList});

  SenderData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    mobile = json["mobile"];
    address = json["address"];
    category_id = json["category_id"];
    cretaed_at = json["cretaed_at"];
    update_at = json["update_at"];
    category = json["category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;

    data["name"] = name;
    data["mobile"] = mobile;
    data["address"] = address;
    data["category_id"] = category_id;
    data["cretaed_at"] = cretaed_at;
    data["update_at"] = update_at;
    data["category"] = category;

    return data;
  }
}
