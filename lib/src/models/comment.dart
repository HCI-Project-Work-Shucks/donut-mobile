import 'dart:ffi';

class Comment {
  int id;
  Int8 targetType;
  int targetId;
  int creator;
  String desc;
  DateTime updated;
  bool deleted;

  Comment(
    this.id,
    this.targetType,
    this.targetId,
    this.creator,
    this.desc,
    this.updated,
    this.deleted,
  );

  //final response = http.get(Url)

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      json['id'],
      json['target_type'],
      json['target_id'],
      json['creator'],
      json['desc'],
      json['updated'],
      json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['target_type'] = targetType;
    data['target_id'] = targetId;
    data['creator'] = creator;
    data['desc'] = desc;
    data['updated'] = updated;
    data['deleted'] = deleted;
    return data;
  }
}
