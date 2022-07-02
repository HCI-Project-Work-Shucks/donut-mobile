import 'package:http/http.dart' as http;

class Donate {
  int id;
  int creator;
  String description;
  int item;
  bool closed;
  DateTime updated;
  bool deleted;

  Donate(
    this.id,
    this.creator,
    this.description,
    this.item,
    this.closed,
    this.updated,
    this.deleted,
  );

  //final response = http.get('/api/v1/donates')

  factory Donate.fromJson(Map<String, dynamic> json) {
    return Donate(
      json['id'],
      json['creator'],
      json['description'],
      json['item'],
      json['closed'],
      json['updated'],
      json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['creator'] = creator;
    data['item'] = item;
    data['closed'] = closed;
    data['updated'] = updated;
    data['deleted'] = deleted;
    return data;
  }
}
