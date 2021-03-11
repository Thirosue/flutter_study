import '../model/response/api_response.dart';

abstract class AuthRepository {
  Future<ApiResponse> auth();

  Future<ApiResponse> refresh();
}
