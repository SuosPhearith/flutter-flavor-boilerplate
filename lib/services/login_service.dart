import 'package:wsm_mobile_app/models/login_model.dart';
import 'package:wsm_mobile_app/utils/dio.client.dart';

class LoginService {
  Future<String> login(LoginRequest request) async {
    final response = await DioClient.dio.post(
      "/api/mini/login",
      data: request.toJson(),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Invalid login response");
    }
  }
}
