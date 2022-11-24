class User {
  int? id;
  String? email;
  String? username;
  String? createdAt;
  String? updatedAt;
  String? avatar;
  bool? isStaff;
  String? role;

  User(
      {this.id,
      this.email,
      this.username,
      this.createdAt,
      this.updatedAt,
      this.avatar,
      this.isStaff,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatar = json['avatar'];
    isStaff = json['is_staff'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['avatar'] = this.avatar;
    data['is_staff'] = this.isStaff;
    data['role'] = this.role;
    return data;
  }
}

