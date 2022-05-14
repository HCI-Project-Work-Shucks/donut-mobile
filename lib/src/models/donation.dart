class Donation {
  int id;
  int creator;
  int item;
  bool closed;
  DateTime updated;
  bool deleted;

  Donation(this.id, this.creator, this.item, this.closed, this.updated, this.deleted);

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
        json['id'],
        json['creator'],
        json['item'],
        json['closed'],
        json['updated'],
        json['deleted']
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