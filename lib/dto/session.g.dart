// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$_$_SessionFromJson(Map<String, dynamic> json) {
  return _$_Session(
    id: json['id'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    email: json['email'] as String,
    tel: json['tel'] as String,
    roles: (json['roles'] as List)?.map((e) => e as String)?.toList(),
    permissionKeyList: (json['permission_key_list'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    jwt: json['jwt'] as String,
  );
}

Map<String, dynamic> _$_$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'tel': instance.tel,
      'roles': instance.roles,
      'permission_key_list': instance.permissionKeyList,
      'jwt': instance.jwt,
    };
