class Thread {
  int id;
  int fulfilment; //id
  int initiator;
  int peer; //id

  Thread(
    this.id,
    this.fulfilment,
    this.initiator,
    this.peer,
  );

  //final response = http.get(Url)

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
      json['id'],
      json['fulfilment'],
      json['initiator'],
      json['peer'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fulfilment'] = fulfilment;
    data['initiator'] = initiator;
    data['peer'] = peer;
    return data;
  }
}
