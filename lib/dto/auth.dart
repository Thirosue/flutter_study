import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.tel,
    this.roles,
    this.permissionKeyList,
    this.jwt,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String tel;
  List<String> roles;
  List<String> permissionKeyList;
  String jwt;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Response {
  List<Data> data = [];
  String message;

  Response(this.data, this.message);

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
