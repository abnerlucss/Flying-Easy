// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      idPassagem: json['idPassagem'] as int,
      partida: json['partida'] as String,
      aeroporto: json['aeroporto'] as String,
      destino: json['destino'] as String,
      dataHoraEmbarque: DateTime.parse(json['dataHoraEmbarque'] as String),
      dataHoraDesembarque:
          DateTime.parse(json['dataHoraDesembarque'] as String),
      numeroAssento: json['numeroAssento'] as int,
      idPassageiro: json['idPassageiro'] as int?,
      nomeClasse: json['nomeClasse'] as String,
      nomeCompanhia: json['nomeCompanhia'] as String,
      preco: (json['preco'] as num).toDouble(),
      idVoo: json['idVoo'] as int,
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'idPassagem': instance.idPassagem,
      'partida': instance.partida,
      'aeroporto': instance.aeroporto,
      'destino': instance.destino,
      'dataHoraEmbarque': instance.dataHoraEmbarque.toIso8601String(),
      'dataHoraDesembarque': instance.dataHoraDesembarque.toIso8601String(),
      'numeroAssento': instance.numeroAssento,
      'idPassageiro': instance.idPassageiro,
      'nomeClasse': instance.nomeClasse,
      'nomeCompanhia': instance.nomeCompanhia,
      'preco': instance.preco,
      'idVoo': instance.idVoo,
    };
