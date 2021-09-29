// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_pass_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketPassModel _$TicketPassModelFromJson(Map<String, dynamic> json) =>
    TicketPassModel(
      nomePassageiro: json['nomePassageiro'] as String,
      cpfPassageiro: json['cpfPassageiro'] as String,
      codigoLocalizador: json['codigoLocalizador'] as String,
    );

Map<String, dynamic> _$TicketPassModelToJson(TicketPassModel instance) =>
    <String, dynamic>{
      'nomePassageiro': instance.nomePassageiro,
      'cpfPassageiro': instance.cpfPassageiro,
      'codigoLocalizador': instance.codigoLocalizador,
    };
