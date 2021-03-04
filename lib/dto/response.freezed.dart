// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Response _$ResponseFromJson(Map<String, dynamic> json) {
  return _Response.fromJson(json);
}

/// @nodoc
class _$ResponseTearOff {
  const _$ResponseTearOff();

// ignore: unused_element
  _Response call({List<dynamic> data, @required String message}) {
    return _Response(
      data: data,
      message: message,
    );
  }

// ignore: unused_element
  Response fromJson(Map<String, Object> json) {
    return Response.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Response = _$ResponseTearOff();

/// @nodoc
mixin _$Response {
  List<dynamic> get data;
  String get message;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ResponseCopyWith<Response> get copyWith;
}

/// @nodoc
abstract class $ResponseCopyWith<$Res> {
  factory $ResponseCopyWith(Response value, $Res Function(Response) then) =
      _$ResponseCopyWithImpl<$Res>;
  $Res call({List<dynamic> data, String message});
}

/// @nodoc
class _$ResponseCopyWithImpl<$Res> implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._value, this._then);

  final Response _value;
  // ignore: unused_field
  final $Res Function(Response) _then;

  @override
  $Res call({
    Object data = freezed,
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as List<dynamic>,
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
abstract class _$ResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory _$ResponseCopyWith(_Response value, $Res Function(_Response) then) =
      __$ResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> data, String message});
}

/// @nodoc
class __$ResponseCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$ResponseCopyWith<$Res> {
  __$ResponseCopyWithImpl(_Response _value, $Res Function(_Response) _then)
      : super(_value, (v) => _then(v as _Response));

  @override
  _Response get _value => super._value as _Response;

  @override
  $Res call({
    Object data = freezed,
    Object message = freezed,
  }) {
    return _then(_Response(
      data: data == freezed ? _value.data : data as List<dynamic>,
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Response with DiagnosticableTreeMixin implements _Response {
  const _$_Response({this.data, @required this.message})
      : assert(message != null);

  factory _$_Response.fromJson(Map<String, dynamic> json) =>
      _$_$_ResponseFromJson(json);

  @override
  final List<dynamic> data;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Response(data: $data, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Response'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Response &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ResponseCopyWith<_Response> get copyWith =>
      __$ResponseCopyWithImpl<_Response>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResponseToJson(this);
  }
}

abstract class _Response implements Response {
  const factory _Response({List<dynamic> data, @required String message}) =
      _$_Response;

  factory _Response.fromJson(Map<String, dynamic> json) = _$_Response.fromJson;

  @override
  List<dynamic> get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$ResponseCopyWith<_Response> get copyWith;
}
