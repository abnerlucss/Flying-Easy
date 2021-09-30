import 'package:app_passagens_aereas/modules/flight_details/models/ticket_model.dart';
import 'package:app_passagens_aereas/modules/onboarding/onboarding_page.dart';
import 'package:app_passagens_aereas/modules/payment/cubit/payment_cubit.dart';
import 'package:app_passagens_aereas/modules/payment/cubit/payment_state.dart';
import 'package:app_passagens_aereas/modules/payment/model/payment_model.dart';
import 'package:app_passagens_aereas/modules/payment/page/payment_success.dart';
import 'package:app_passagens_aereas/modules/shared/constants/color_constants.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/pay_button_widget.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    Key? key,
    required this.idPassenger,
    required this.ticketModel,
  }) : super(key: key);

  final int idPassenger;
  final TicketModel? ticketModel;

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final cardNumberController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final cardExpireDateController = TextEditingController();
  final cardCVVController = TextEditingController();
  bool isShowBackground = false;
  final cvvFocusNode = FocusNode();

  final maskDate = new MaskTextInputFormatter(
      mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  final maskCardNumber = new MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});

  final maskCVVNumber =
      new MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

  GlobalKey<FormState> _cardFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        checkState(state, context);
      },
      builder: (context, state) {
        if (state == PaymentState.load()) {
          return load();
        }
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Pagamento",
            ),
            backgroundColor: Color(ColorConstants.darkPrimaryBlue),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CreditCard(
                  cardNumber: cardNumberController.text,
                  cardExpiry: cardExpireDateController.text,
                  cardHolderName: cardHolderNameController.text,
                  cvv: cardCVVController.text,
                  bankName: "EasyFlying Card",
                  cardType: CardType
                      .masterCard, // Optional if you want to override Card Type
                  showBackSide: isShowBackground,
                  frontBackground: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF4B6584),
                    ),
                  ),
                  backBackground: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF4B6584),
                    ),
                  ),
                  backTextColor: Colors.white,
                  textExpDate: 'Vencimento',
                  textName: 'Name',
                  textExpiry: 'MM/AA',
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  onChanged: () {
                    setState(
                      () {
                        if (cvvFocusNode.hasFocus) {
                          isShowBackground = true;
                        } else {
                          isShowBackground = false;
                        }
                      },
                    );
                  },
                  key: _cardFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        formatter: maskCardNumber,
                        labelTextField: "Número do cartão",
                        textInputType: TextInputType.number,
                        controller: cardNumberController,
                        validator: (text) {
                          if (text!.isEmpty)
                            return "O número do cartão não pode ser nulo";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        formatter: maskDate,
                        labelTextField: "Data de Vencimento",
                        textInputType: TextInputType.number,
                        controller: cardExpireDateController,
                        validator: (text) {
                          if (text!.isEmpty)
                            return "Preencha a data de vencimento";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelTextField: "Nome impresso",
                        textInputType: TextInputType.name,
                        controller: cardHolderNameController,
                        validator: (text) {
                          if (text!.isEmpty) return "Preencha o nome";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        formatter: maskCVVNumber,
                        focusNode: cvvFocusNode,
                        labelTextField: "Código de segurança",
                        textInputType: TextInputType.number,
                        controller: cardCVVController,
                        validator: (text) {
                          if (text!.isEmpty) return "Preencha o CVV";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PayButtonWidget(
                        title: "Pagar",
                        ticketModelPrice: widget.ticketModel!.preco,
                        onpress: () {
                          if (!_cardFormKey.currentState!.validate()) {
                            onTapFailed(context);
                          } else {
                            onTap(context);
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void onTap(BuildContext context) {
    PaymentModel paymentModel = PaymentModel(
        idPassenger: widget.idPassenger,
        idTicket: widget.ticketModel!.idPassagem);

    print(paymentModel.toJson());

    BlocProvider.of<PaymentCubit>(context).postPaymentTicket(paymentModel);
  }

  void onTapFailed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preencha os campos corretamente'),
      ),
    );
  }

  Scaffold load() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xFF1F2A36),
        ),
      ),
    );
  }

  void checkState(PaymentState state, BuildContext context) {
    if (state.state == BasicStateEnum.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentSuccessPage(
            idPassenger: widget.idPassenger,
          ),
        ),
      );
    } else if (state.state == BasicStateEnum.failed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro de pagamento'),
        ),
      );
    }
  }
}
