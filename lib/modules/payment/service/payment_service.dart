import 'package:app_passagens_aereas/modules/payment/model/payment_model.dart';
import 'package:app_passagens_aereas/modules/payment/model/ticket_pass_model.dart';
import 'package:dio/dio.dart';

class PaymentService {
  Future<TicketPassModel?> postPaymentTicket(PaymentModel paymentModel) async {
    try {
      var response = await Dio().put(
        'https://msv-passagem.herokuapp.com/v1/passagem',
        data: paymentModel.toJson(),
      );

      return TicketPassModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
