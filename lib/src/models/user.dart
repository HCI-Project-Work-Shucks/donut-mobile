class User {
  int id;
  String name;
  String phone;
  String email;
  bool verified;
  bool deleted;

  User(
    this.id,
    this.name,
    this.phone,
    this.email,
    this.verified,
    this.deleted,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['phone'],
      json['email'],
      json['verified'],
      json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['verified'] = verified;
    data['deleted'] = deleted;
    return data;
  }
}
