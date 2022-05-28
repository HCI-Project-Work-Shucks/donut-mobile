class Address {
  int id;
  int owner;
  String title;
  String desc;
  String postcode;

  Address(
    this.id,
    this.owner,
    this.title,
    this.desc,
    this.postcode,
  );

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      json['id'],
      json['owner'],
      json['title'],
      json['desc'],
      json['postcode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner'] = owner;
    data['title'] = title;
    data['desc'] = desc;
    data['postcode'] = postcode;
    return data;
  }
}
