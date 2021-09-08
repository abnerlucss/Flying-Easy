class LoginModel {
  String? cpf;
  String? senha;

  LoginModel({this.cpf, this.senha});

  Map toJson() {
    return {
      "cpf": cpf!.replaceAll(new RegExp(r'[^0-9]'), ''),
      "senha": senha,
    };
  }
}
