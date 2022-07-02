class User {
  int uid, phone, completedDeals, pendingDeals;
  String name, email, password, about, profilePic;

  User(
    this.uid,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.completedDeals,
    this.pendingDeals,
    this.about,
    this.profilePic,
  );

  //final response = http.get(/api/v1/users)

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['uid'],
      json['name'],
      json['phone'],
      json['email'],
      json['password'],
      json['completedDeals'],
      json['pendingDeals'],
      json['about'],
      json['profilePic'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['completedDeals'] = completedDeals;
    data['pendingDeals'] = pendingDeals;
    data['about'] = about;
    data['profilePic'] = profilePic;
    return data;
  }
}
