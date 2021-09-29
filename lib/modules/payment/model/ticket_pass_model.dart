import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ticket_pass_model.g.dart';

@JsonSerializable()
class TicketPassModel extends Equatable {
  TicketPassModel({
    required this.nomePassageiro,
    required this.cpfPassageiro,
    required this.codigoLocalizador,
  });

  final String nomePassageiro;
  final String cpfPassageiro;
  final String codigoLocalizador;

  factory TicketPassModel.fromJson(Map<String, dynamic> json) =>
      _$TicketPassModelFromJson(json);

  @override
  List<Object?> get props => [nomePassageiro, cpfPassageiro, codigoLocalizador];
}
