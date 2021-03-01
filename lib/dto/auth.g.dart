// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    tel: json['tel'] as String,
    roles: (json['roles'] as List)?.map((e) => e as String)?.toList(),
    permissionKeyList:
        (json['permissionKeyList'] as List)?.map((e) => e as String)?.toList(),
    jwt: json['jwt'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'tel': instance.tel,
      'roles': instance.roles,
      'permissionKeyList': instance.permissionKeyList,
      'jwt': instance.jwt,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['message'] as String,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };
