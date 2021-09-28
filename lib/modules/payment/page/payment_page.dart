import 'package:app_passagens_aereas/modules/flight_details/models/ticket_model.dart';
import 'package:app_passagens_aereas/modules/shared/constants/color_constants.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/pay_button_widget.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/spacing_txt_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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

  GlobalKey<FormState> _cardFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            CreditCardWidget(
              cardType: CardType.mastercard,
              textStyle: TextStyle(
                fontSize: 18,
                color: Color(0xFFFFFFFF),
              ),
              labelExpiredDate: "mm/aa",
              isHolderNameVisible: true,
              cardBgColor: Color(0XFF4B6584),
              cardHolderName: cardHolderNameController.text,
              cardNumber: cardNumberController.text,
              cvvCode: cardCVVController.text,
              expiryDate: cardExpireDateController.text,
              onCreditCardWidgetChange: (CreditCardBrand) {},
              showBackView: false,
            ),
            Form(
              onChanged: () {
                setState(() {});
              },
              key: _cardFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomTextField(
                      labelTextField: "Número do cartão",
                      textInputType: TextInputType.number,
                      controller: cardNumberController,
                      validator: (text) {
                        if (text!.isEmpty)
                          return "O número do cartão não pode ser nulo";
                      },
                    ),
                    SpacingTextFormFields(),
                    CustomTextField(
                      labelTextField: "Data de Vencimento",
                      textInputType: TextInputType.number,
                      controller: cardExpireDateController,
                      validator: (text) {
                        if (text!.isEmpty)
                          return "Preencha a data de vencimento";
                      },
                    ),
                    SpacingTextFormFields(),
                    CustomTextField(
                      labelTextField: "Nome impresso",
                      textInputType: TextInputType.name,
                      controller: cardHolderNameController,
                      validator: (text) {
                        if (text!.isEmpty) return "Preencha o nome";
                      },
                    ),
                    SpacingTextFormFields(),
                    CustomTextField(
                      labelTextField: "Código de segurança",
                      textInputType: TextInputType.number,
                      controller: cardCVVController,
                      validator: (text) {
                        if (text!.isEmpty) return "Preencha o CVV";
                      },
                    ),
                    SpacingTextFormFields(),
                    PayButtonWidget(
                      title: "Pagar",
                      ticketModelPrice: 905.30,
                      onpress: () {
                        if (!_cardFormKey.currentState!.validate()) {
                          onTapFailed(context);
                        } else {
                          // onTap(context);
                          print("Batatinha");
                        }
                      },
                    ),
                    SpacingTextFormFields(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // void onTap(BuildContext context) {
  //   loginModel.cpf = loginController.text;
  //   loginModel.senha = passwordController.text;

  //   print(loginModel);

  //   BlocProvider.of<LoginCubit>(context).postLogin(loginModel);
  // }

  void onTapFailed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preencha todos os campos'),
      ),
    );
  }
}
