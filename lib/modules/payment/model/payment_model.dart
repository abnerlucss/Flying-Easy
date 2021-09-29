import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable {
  PaymentModel({
    required this.idPassenger,
    required this.idTicket,
  });

  final int idPassenger;
  final int idTicket;

  Map toJson() {
    return {
      "idPassageiro": idPassenger,
      "idPassagem": idTicket,
    };
  }

  @override
  List<Object?> get props => [idPassenger, idTicket];
}
