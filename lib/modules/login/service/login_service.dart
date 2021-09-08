import 'package:app_passagens_aereas/modules/login/models/login_model.dart';
import 'package:dio/dio.dart';

class LoginService {
  Future postHttp(LoginModel loginJsonObject) async {
    try {
      var response = await Dio().post(
          'https://msv-passagem.herokuapp.com/v1/passageiro/login/',
          data: loginJsonObject.toJson());
      print(response);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
