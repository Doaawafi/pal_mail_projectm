class RoleData {
  List<Roles>? roles;

  RoleData({this.roles});

  RoleData.fromJson(Map<String, dynamic> json) {
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? usersCount;
  List<Users>? users;

  Roles(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.usersCount,
      this.users});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    usersCount = json['users_count'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['users_count'] = usersCount;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  Null? image;
  String? emailVerifiedAt;
  String? roleId;
  String? createdAt;
  String? updatedAt;

  Users(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.emailVerifiedAt,
      this.roleId,
      this.createdAt,
      this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['email_verified_at'] = emailVerifiedAt;
    data['role_id'] = roleId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Role {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? users_count;
  Users? users;

  Role(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.users_count,
      this.users});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users_count = json["users_count"];
    users = json["users"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['users_count'] = users_count;
    data["users"] = users;
    return data;
  }
}
