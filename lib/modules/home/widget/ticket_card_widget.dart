import 'package:app_passagens_aereas/modules/flight_details/page/flight_details_page.dart';
import 'package:app_passagens_aereas/modules/home/models/flight_model.dart';
import 'package:app_passagens_aereas/modules/home/widget/green_button_widget.dart';
import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketCardWidget extends StatelessWidget {
  const TicketCardWidget({
    Key? key,
    required this.flightModel,
    required this.idPassenger,
  }) : super(key: key);

  final FlightModel flightModel;
  final int idPassenger;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            height: 220,
            width: .8 * constraints.maxWidth,
            child: Column(
              children: [
                SizedBox(
                  height: .085 * (.8 * constraints.maxWidth),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "De: ${flightModel.partida}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 0.01 * (.8 * constraints.maxWidth),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 35,
                    ),
                    SizedBox(
                      width: 0.01 * (.8 * constraints.maxWidth),
                    ),
                    Text(
                      "Para: ${flightModel.destino}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Data: ${DateFormat('dd/M/y').format(flightModel.dataHoraEmbarque)} ",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 0.05 * (.8 * constraints.maxWidth),
                    ),
                    Text(
                      "Hora: ${DateFormat.jm().format(flightModel.dataHoraEmbarque)}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 0.05 * (.8 * constraints.maxWidth),
                      decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    DottedLine(
                      lineLength: 0.9 * (.8 * constraints.maxWidth),
                      dashLength: 15,
                      lineThickness: 3,
                      dashColor: Color(0XFF616161),
                    ),
                    Container(
                      height: 20,
                      width: 0.05 * (.8 * constraints.maxWidth),
                      decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: .1 * (.8 * constraints.maxWidth),
                    ),
                    Image.asset(
                      checkCompanyLogo(flightModel.identificadorCompanhia),
                      height: .2 * 220,
                      width: .3 * .8 * constraints.maxWidth,
                    ),
                    Spacer(),
                    GreenButtonWidget(
                      text: "Detalhes",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FlightDetailsPage(
                                      idVoo: flightModel.idVoo,
                                      idPassenger: idPassenger,
                                    )));
                      },
                    ),
                    SizedBox(
                      width: .1 * (.8 * constraints.maxWidth),
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0XFFF1F1F1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, 8),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static String checkCompanyLogo(String companyIdentifier) {
    switch (companyIdentifier) {
      case "GLO001":
        return ImagesConstants.logoGol;

      case "AZU002":
        return ImagesConstants.logoAzul;

      case "AVA003":
        return ImagesConstants.logoAvianca;

      case "TAM004":
        return ImagesConstants.logoLatam;

      case "PAM005":
        return ImagesConstants.logoMap;

      default:
        return "";
    }
  }
}
