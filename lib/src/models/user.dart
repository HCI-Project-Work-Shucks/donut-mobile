import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';


@JsonSerializable()
class User {
  User(this.id, this.name, this.phone, this.email, this.verified);

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "phone")
  String phone;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "verified")
  bool verified;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}