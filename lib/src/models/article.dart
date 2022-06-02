class Article {
  int id;
  int category;
  String title;
  int quantity;
  String desc;
  bool deleted;
  DateTime updated;

  Article(
    this.id,
    this.category,
    this.title,
    this.quantity,
    this.desc,
    this.deleted,
    this.updated,
  );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json['id'],
      json['category'],
      json['title'],
      json['quantity'],
      json['desc'],
      json['deleted'],
      json['updated'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['title'] = title;
    data['quantity'] = quantity;
    data['desc'] = desc;
    data['deleted'] = deleted;
    data['updated'] = updated;
    return data;
  }
}
