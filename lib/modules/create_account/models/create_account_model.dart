class CreateAccountModel {
  String? name;
  String? birthDate;
  String? cpf;
  String? email;
  String? phone;
  String? password;

  CreateAccountModel({
    this.name,
    this.birthDate,
    this.cpf,
    this.email,
    this.phone,
    this.password,
  });

  Map toJson() {
    return {
      "nome": name,
      "cpf": cpf!.replaceAll(new RegExp(r'[^0-9]'), ''),
      "email": email,
      "telefone": phone!.replaceAll(new RegExp(r'[^0-9]'), ''),
      "dataNascimento": birthDate,
      "senha": password
    };
  }
}
