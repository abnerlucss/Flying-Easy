// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightModel _$FlightModelFromJson(Map<String, dynamic> json) => FlightModel(
      idVoo: json['idVoo'] as int,
      partida: json['partida'] as String,
      aeroporto: json['aeroporto'] as String,
      dataHoraEmbarque: DateTime.parse(json['dataHoraEmbarque'] as String),
      dataHoraDesembarque:
          DateTime.parse(json['dataHoraDesembarque'] as String),
      destino: json['destino'] as String,
      identificadorCompanhia: json['identificadorCompanhia'] as String,
      qtdEconomica: json['qtdEconomica'] as int,
      qtdExecutiva: json['qtdExecutiva'] as int,
      qtdPrimeiraClasse: json['qtdPrimeiraClasse'] as int,
      status: json['status'] as String,
      precoPrimeiraClasse: (json['precoPrimeiraClasse'] as num).toDouble(),
      precoExecutiva: (json['precoExecutiva'] as num).toDouble(),
      precoEconomica: (json['precoEconomica'] as num).toDouble(),
      idPortao: json['idPortao'] as int,
    );

Map<String, dynamic> _$FlightModelToJson(FlightModel instance) =>
    <String, dynamic>{
      'idVoo': instance.idVoo,
      'partida': instance.partida,
      'aeroporto': instance.aeroporto,
      'dataHoraEmbarque': instance.dataHoraEmbarque.toIso8601String(),
      'dataHoraDesembarque': instance.dataHoraDesembarque.toIso8601String(),
      'destino': instance.destino,
      'identificadorCompanhia': instance.identificadorCompanhia,
      'qtdEconomica': instance.qtdEconomica,
      'qtdExecutiva': instance.qtdExecutiva,
      'qtdPrimeiraClasse': instance.qtdPrimeiraClasse,
      'status': instance.status,
      'precoPrimeiraClasse': instance.precoPrimeiraClasse,
      'precoExecutiva': instance.precoExecutiva,
      'precoEconomica': instance.precoEconomica,
      'idPortao': instance.idPortao,
    };
