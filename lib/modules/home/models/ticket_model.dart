import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel extends Equatable {
  TicketModel({
    required this.idPassagem,
    required this.partida,
    required this.aeroporto,
    required this.destino,
    required this.dataHoraEmbarque,
    required this.dataHoraDesembarque,
    required this.numeroAssento,
    required this.nomeClasse,
    required this.nomeCompanhia,
    required this.preco,
    required this.idVoo,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  final int idPassagem;
  final String partida;
  final String aeroporto;
  final String destino;
  final DateTime dataHoraEmbarque;
  final DateTime dataHoraDesembarque;
  final int numeroAssento;
  final String nomeClasse;
  final String nomeCompanhia;
  final double preco;
  final int idVoo;

  @override
  List<Object?> get props => [idVoo];
}
