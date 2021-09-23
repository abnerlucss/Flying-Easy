import 'package:json_annotation/json_annotation.dart';
part 'flight_model.g.dart';

@JsonSerializable()
class FlightModel {
  FlightModel({
    required this.idVoo,
    required this.partida,
    required this.aeroporto,
    required this.dataHoraEmbarque,
    required this.dataHoraDesembarque,
    required this.destino,
    required this.identificadorCompanhia,
    required this.qtdEconomica,
    required this.qtdExecutiva,
    required this.qtdPrimeiraClasse,
    required this.status,
    required this.precoPrimeiraClasse,
    required this.precoExecutiva,
    required this.precoEconomica,
    required this.idPortao,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) =>
      _$FlightModelFromJson(json);

  final int idVoo;
  final String partida;
  final String aeroporto;
  final DateTime dataHoraEmbarque;
  final DateTime dataHoraDesembarque;
  final String destino;
  final String identificadorCompanhia;
  final int qtdEconomica;
  final int qtdExecutiva;
  final int qtdPrimeiraClasse;
  final String status;
  final double precoPrimeiraClasse;
  final double precoExecutiva;
  final double precoEconomica;
  final int idPortao;
}
