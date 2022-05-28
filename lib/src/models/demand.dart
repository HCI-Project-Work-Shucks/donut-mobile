class Demand {
  int id;
  int creator;
  int item;
  bool closed;
  DateTime updated;
  bool deleted;

  Demand(
    this.id,
    this.creator,
    this.item,
    this.closed,
    this.updated,
    this.deleted,
  );

  factory Demand.fromJson(Map<String, dynamic> json) {
    return Demand(
      json['id'],
      json['creator'],
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
