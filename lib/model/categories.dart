class CategoriesData {
  List<Categories>? categories;

  CategoriesData({this.categories});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? sendersCount;
  List<Senders>? senders;

  Categories(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.sendersCount,
      this.senders});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sendersCount = json['senders_count'];
    if (json['senders'] != null) {
      senders = <Senders>[];
      json['senders'].forEach((v) {
        senders!.add(Senders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['senders_count'] = sendersCount;
    if (senders != null) {
      data['senders'] = senders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Senders {
  int? id;
  String? name;
  String? mobile;
  String? address;
  String? categoryId;
  String? createdAt;
  String? updatedAt;

  Senders(
      {this.id,
      this.name,
      this.mobile,
      this.address,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  Senders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['address'] = address;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
