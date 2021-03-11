// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
class _$StoreTearOff {
  const _$StoreTearOff();

  _Store call(
      {required String idToken,
      required String refreshToken,
      required String accessToken}) {
    return _Store(
      idToken: idToken,
      refreshToken: refreshToken,
      accessToken: accessToken,
    );
  }

  Store fromJson(Map<String, Object> json) {
    return Store.fromJson(json);
  }
}

/// @nodoc
const $Store = _$StoreTearOff();

/// @nodoc
mixin _$Store {
  String get idToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res>;
  $Res call({String idToken, String refreshToken, String accessToken});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res> implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  final Store _value;
  // ignore: unused_field
  final $Res Function(Store) _then;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? refreshToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) then) =
      __$StoreCopyWithImpl<$Res>;
  @override
  $Res call({String idToken, String refreshToken, String accessToken});
}

/// @nodoc
class __$StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(_Store _value, $Res Function(_Store) _then)
      : super(_value, (v) => _then(v as _Store));

  @override
  _Store get _value => super._value as _Store;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? refreshToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_Store(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Store with DiagnosticableTreeMixin implements _Store {
  const _$_Store(
      {required this.idToken,
      required this.refreshToken,
      required this.accessToken});

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreFromJson(json);

  @override
  final String idToken;
  @override
  final String refreshToken;
  @override
  final String accessToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Store(idToken: $idToken, refreshToken: $refreshToken, accessToken: $accessToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Store'))
      ..add(DiagnosticsProperty('idToken', idToken))
      ..add(DiagnosticsProperty('refreshToken', refreshToken))
      ..add(DiagnosticsProperty('accessToken', accessToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Store &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality()
                    .equals(other.idToken, idToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idToken) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(accessToken);

  @JsonKey(ignore: true)
  @override
  _$StoreCopyWith<_Store> get copyWith =>
      __$StoreCopyWithImpl<_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreToJson(this);
  }
}

abstract class _Store implements Store {
  const factory _Store(
      {required String idToken,
      required String refreshToken,
      required String accessToken}) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  String get idToken => throw _privateConstructorUsedError;
  @override
  String get refreshToken => throw _privateConstructorUsedError;
  @override
  String get accessToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreCopyWith<_Store> get copyWith => throw _privateConstructorUsedError;
}
