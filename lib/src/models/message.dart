class Message {
  int id;
  int thread;
  String message;
  int image;
  DateTime updated;

  Message(this.id, this.thread, this.message, this.image, this.updated);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      json['id'],
      json['thread'],
      json['message'],
      json['image'],
      json['updated']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thread'] = thread;
    data['message'] = message;
    data['image'] = image;
    data['updated'] = updated;
    return data;
  }
}