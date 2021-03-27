import 'dart:io';

import 'package:dio/dio.dart';

import '../model/calendar/booking.dart';

class BookingRepository {
  static const String _baseUrl =
      'https://thirosue.github.io/hosting-image2/flutter_study';

  final dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: 50000,
    receiveTimeout: 100000,
    // 5s
    headers: {
      HttpHeaders.userAgentHeader: "dio",
      "api": "1.0.0",
    },
    contentType: Headers.jsonContentType,
    // Transform the response data to a String encoded with UTF8.
    // The default value is [ResponseType.JSON].
    responseType: ResponseType.plain,
  ));

  Future<void> create(Booking booking) async {
    Response response;
    response = await dio.get(
      '/booking.post.json',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to auth');
    }
  }
}
