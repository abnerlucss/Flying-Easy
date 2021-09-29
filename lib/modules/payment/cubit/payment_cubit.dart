import 'package:app_passagens_aereas/modules/payment/cubit/payment_state.dart';
import 'package:app_passagens_aereas/modules/payment/model/payment_model.dart';
import 'package:app_passagens_aereas/modules/payment/model/ticket_pass_model.dart';
import 'package:app_passagens_aereas/modules/payment/service/payment_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentState.init());

  postPaymentTicket(PaymentModel paymentModel) async {
    emit(PaymentState.load());
    final data = await PaymentService().postPaymentTicket(paymentModel);
    print(data);
    if (data is TicketPassModel) {
      emit(PaymentState.success());
    } else {
      emit(PaymentState.failed());
    }
  }
}
