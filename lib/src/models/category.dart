class Category {
  int id;
  int parent;
  String title;

  Category(this.id, this.parent, this.title);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      json['id'],
      json['parent'],
      json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent'] = parent;
    data['title'] = title;
    return data;
  }
}