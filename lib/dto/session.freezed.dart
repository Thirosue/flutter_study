// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
class _$SessionTearOff {
  const _$SessionTearOff();

// ignore: unused_element
  _Session call(
      {@required String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String tel,
      List<String> roles,
      @JsonKey(name: 'permission_key_list') List<String> permissionKeyList,
      @required String jwt}) {
    return _Session(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      tel: tel,
      roles: roles,
      permissionKeyList: permissionKeyList,
      jwt: jwt,
    );
  }

// ignore: unused_element
  Session fromJson(Map<String, Object> json) {
    return Session.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Session = _$SessionTearOff();

/// @nodoc
mixin _$Session {
  String get id;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  String get email;
  String get tel;
  List<String> get roles;
  @JsonKey(name: 'permission_key_list')
  List<String> get permissionKeyList;
  String get jwt;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String tel,
      List<String> roles,
      @JsonKey(name: 'permission_key_list') List<String> permissionKeyList,
      String jwt});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  final Session _value;
  // ignore: unused_field
  final $Res Function(Session) _then;

  @override
  $Res call({
    Object id = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object email = freezed,
    Object tel = freezed,
    Object roles = freezed,
    Object permissionKeyList = freezed,
    Object jwt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      email: email == freezed ? _value.email : email as String,
      tel: tel == freezed ? _value.tel : tel as String,
      roles: roles == freezed ? _value.roles : roles as List<String>,
      permissionKeyList: permissionKeyList == freezed
          ? _value.permissionKeyList
          : permissionKeyList as List<String>,
      jwt: jwt == freezed ? _value.jwt : jwt as String,
    ));
  }
}

/// @nodoc
abstract class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) then) =
      __$SessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String tel,
      List<String> roles,
      @JsonKey(name: 'permission_key_list') List<String> permissionKeyList,
      String jwt});
}

/// @nodoc
class __$SessionCopyWithImpl<$Res> extends _$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(_Session _value, $Res Function(_Session) _then)
      : super(_value, (v) => _then(v as _Session));

  @override
  _Session get _value => super._value as _Session;

  @override
  $Res call({
    Object id = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object email = freezed,
    Object tel = freezed,
    Object roles = freezed,
    Object permissionKeyList = freezed,
    Object jwt = freezed,
  }) {
    return _then(_Session(
      id: id == freezed ? _value.id : id as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      email: email == freezed ? _value.email : email as String,
      tel: tel == freezed ? _value.tel : tel as String,
      roles: roles == freezed ? _value.roles : roles as List<String>,
      permissionKeyList: permissionKeyList == freezed
          ? _value.permissionKeyList
          : permissionKeyList as List<String>,
      jwt: jwt == freezed ? _value.jwt : jwt as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Session with DiagnosticableTreeMixin implements _Session {
  const _$_Session(
      {@required this.id,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.email,
      this.tel,
      this.roles,
      @JsonKey(name: 'permission_key_list') this.permissionKeyList,
      @required this.jwt})
      : assert(id != null),
        assert(jwt != null);

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$_$_SessionFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  final String tel;
  @override
  final List<String> roles;
  @override
  @JsonKey(name: 'permission_key_list')
  final List<String> permissionKeyList;
  @override
  final String jwt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Session(id: $id, firstName: $firstName, lastName: $lastName, email: $email, tel: $tel, roles: $roles, permissionKeyList: $permissionKeyList, jwt: $jwt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Session'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('tel', tel))
      ..add(DiagnosticsProperty('roles', roles))
      ..add(DiagnosticsProperty('permissionKeyList', permissionKeyList))
      ..add(DiagnosticsProperty('jwt', jwt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Session &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.tel, tel) ||
                const DeepCollectionEquality().equals(other.tel, tel)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.permissionKeyList, permissionKeyList) ||
                const DeepCollectionEquality()
                    .equals(other.permissionKeyList, permissionKeyList)) &&
            (identical(other.jwt, jwt) ||
                const DeepCollectionEquality().equals(other.jwt, jwt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(tel) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(permissionKeyList) ^
      const DeepCollectionEquality().hash(jwt);

  @JsonKey(ignore: true)
  @override
  _$SessionCopyWith<_Session> get copyWith =>
      __$SessionCopyWithImpl<_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SessionToJson(this);
  }
}

abstract class _Session implements Session {
  const factory _Session(
      {@required String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String tel,
      List<String> roles,
      @JsonKey(name: 'permission_key_list') List<String> permissionKeyList,
      @required String jwt}) = _$_Session;

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get email;
  @override
  String get tel;
  @override
  List<String> get roles;
  @override
  @JsonKey(name: 'permission_key_list')
  List<String> get permissionKeyList;
  @override
  String get jwt;
  @override
  @JsonKey(ignore: true)
  _$SessionCopyWith<_Session> get copyWith;
}
