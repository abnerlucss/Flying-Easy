import 'package:app_passagens_aereas/modules/flight_details/flight_details_cubit/flight_details_cubit.dart';
import 'package:app_passagens_aereas/modules/flight_details/flight_details_cubit/flight_details_state.dart';
import 'package:app_passagens_aereas/modules/flight_details/models/ticket_model.dart';
import 'package:app_passagens_aereas/modules/flight_details/view/modal_flight_class_view.dart';
import 'package:app_passagens_aereas/modules/flight_details/view/modal_flight_seats_view.dart';
import 'package:app_passagens_aereas/modules/flight_details/widget/details_button_widget.dart';
import 'package:app_passagens_aereas/modules/home/widget/ticket_card_widget.dart';
import 'package:app_passagens_aereas/modules/shared/constants/color_constants.dart';
import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/pay_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FlightDetailsPage extends StatefulWidget {
  const FlightDetailsPage({Key? key, required this.idVoo}) : super(key: key);

  final int idVoo;

  @override
  _FlightDetailsPageState createState() => _FlightDetailsPageState();
}

class _FlightDetailsPageState extends State<FlightDetailsPage> {
  String titleClass = "Econômica";
  TicketModel? ticket;
  double? price;
  List<TicketModel>? ticketList;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FlightDetailsCubit>(context).getFlightById(widget.idVoo);
    BlocProvider.of<FlightDetailsCubit>(context)
        .getTicketsByIdAndClass(widget.idVoo, titleClass);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.idVoo);

    return BlocConsumer<FlightDetailsCubit, FlightDetailsState>(
      listener: (context, state) {
        checkState(state, context);
      },
      builder: (context, state) {
        if (state.state == BasicStateEnum.load) {
          return load();
        }

        final flight = state.flight;
        ticketList = state.ticketList;
        print(ticketList);

        price = flight!.precoEconomica;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Detalhes",
            ),
            backgroundColor: Color(ColorConstants.darkPrimaryBlue),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        ImagesConstants.detailsBackground,
                        height: .38 * constraints.maxHeight,
                        width: constraints.maxWidth,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: .35 * constraints.maxHeight),
                        child: SizedBox(
                          height: .05 * constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: Container(
                            color: Color(ColorConstants.darkPrimaryBlue),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: .3 * constraints.maxHeight),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: Offset(0, 8),
                                )
                              ],
                            ),
                            height: .12 * constraints.maxHeight,
                            width: .9 * constraints.maxWidth,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${flight.partida}",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      Icons.flight,
                                      size: 35,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${flight.destino}",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: .02 * constraints.maxHeight,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: .05 * constraints.maxWidth),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 16,
                          height: 2,
                        ),
                        children: [
                          TextSpan(
                            text: "Aeroporto: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "${flight.aeroporto}\n"),
                          TextSpan(
                            text: "Data do embarque: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "${DateFormat('dd/M/y').format(flight.dataHoraEmbarque)}\n"),
                          TextSpan(
                            text: "Hora do embarque: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "${DateFormat('dd/M/y').format(flight.dataHoraDesembarque)}\n"),
                          TextSpan(
                            text: "Hora do desembarque: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "${DateFormat.jm().format(flight.dataHoraEmbarque)}\n"),
                          TextSpan(
                            text: "Companhia Aérea: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: .02 * constraints.maxHeight,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: .05 * constraints.maxWidth,
                    ),
                    child: Image.asset(
                      TicketCardWidget.checkCompanyLogo(
                        flight.identificadorCompanhia,
                      ),
                      height: .06 * constraints.maxHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: .02 * constraints.maxHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DetailsButtonWidget(
                        title: "Classe: $titleClass",
                        onpress: () {
                          showModalFlightClass(context);
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      DetailsButtonWidget(
                        title:
                            "Número do assento: ${ticket == null ? "" : ticket!.numeroAssento}",
                        onpress: () {
                          showModalFlightSeats(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: .03 * constraints.maxHeight,
                  ),
                  Center(
                    child: PayButtonWidget(
                      flightModel: flight,
                      title: "Comprar",
                      onpress: () {},
                      seatClass: titleClass,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void showModalFlightClass(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ModalFlightClassView(
          titleClass: titleClass,
          onChanged: (value) {
            setState(
              () {
                titleClass = value!;
                BlocProvider.of<FlightDetailsCubit>(context)
                    .getTicketsByIdAndClass(widget.idVoo, titleClass);
              },
            );
          },
        );
      },
    );
  }

  void showModalFlightSeats(context) {
    ticketList!.sort((a, b) => a.idPassagem.compareTo(b.idPassagem));

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return ModalFlightSeatsView(
          ticketsList: ticketList!,
          onSelected: (value) {
            setState(() {
              ticket = value!;
            });
          },
        );
      },
    );
  }
}

void checkState(FlightDetailsState state, BuildContext context) {
  if (state.state == BasicStateEnum.success) {
    print("Success");
  } else if (state.state == BasicStateEnum.failed) {
    print("Error");
  }
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
