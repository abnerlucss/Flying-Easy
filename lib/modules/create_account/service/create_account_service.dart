import 'package:app_passagens_aereas/modules/create_account/models/create_account_model.dart';
import 'package:dio/dio.dart';

class CreateAccountService {
  Future postAccount(CreateAccountModel accountJsonObject) async {
    try {
      var response = await Dio().post(
          'https://msv-passagem.herokuapp.com/v1/passageiro',
          data: accountJsonObject.toJson());
      print(response);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
