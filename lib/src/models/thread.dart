class Thread {
  int id;
  int fulfilment;
  int initiator;
  int peer;

  Thread(this.id, this.fulfilment, this.initiator, this.peer);

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
      json['id'],
      json['fulfilment'],
      json['initiator'],
      json['peer']
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