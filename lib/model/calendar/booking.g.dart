// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Booking _$_$_BookingFromJson(Map<String, dynamic> json) {
  return _$_Booking(
    day: json['day'] as String,
    time: json['time'] as int,
    at: json['at'] as String,
    cols: json['cols'] as int,
    dateText: json['dateText'] as String,
    name: json['name'] as String,
    tel: json['tel'] as String?,
    request: json['request'] as String?,
  );
}

Map<String, dynamic> _$_$_BookingToJson(_$_Booking instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'at': instance.at,
      'cols': instance.cols,
      'dateText': instance.dateText,
      'name': instance.name,
      'tel': instance.tel,
      'request': instance.request,
    };
