import 'dart:ffi';

class Fulfilment {
  int id;
  Int8 targetType;
  int targetId;
  int creator;
  Int8 status;

  Fulfilment(
    this.id,
    this.targetType,
    this.targetId,
    this.creator,
    this.status,
  );

  //final response = http.get(/api/v1/fulfilments)

  factory Fulfilment.fromJson(Map<String, dynamic> json) {
    return Fulfilment(
      json['id'],
      json['target_type'],
      json['target_id'],
      json['creator'],
      json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['target_type'] = targetType;
    data['target_id'] = targetId;
    data['creator'] = creator;
    data['status'] = status;
    return data;
  }
}
