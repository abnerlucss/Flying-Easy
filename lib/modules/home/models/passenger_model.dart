import 'package:json_annotation/json_annotation.dart';
part 'passenger_model.g.dart';

@JsonSerializable()
class PassengerModel {
  int id;
  String nome;
  String cpf;
  String email;
  String telefone;
  String dataNascimento;
  @JsonKey(ignore: true)
  String? senha;

  factory PassengerModel.fromJson(Map<String, dynamic> json) =>
      _$PassengerModelFromJson(json);

  PassengerModel({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
    required this.dataNascimento,
  });
}
