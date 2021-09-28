import 'package:app_passagens_aereas/modules/flight_details/models/ticket_model.dart';
import 'package:flutter/material.dart';

class ModalFlightSeatsView extends StatefulWidget {
  const ModalFlightSeatsView(
      {Key? key, required this.ticketsList, this.onSelected})
      : super(key: key);

  final List ticketsList;
  final void Function(TicketModel? value)? onSelected;

  @override
  _ModalFlightSeatsViewState createState() => _ModalFlightSeatsViewState();
}

class _ModalFlightSeatsViewState extends State<ModalFlightSeatsView> {
  List<Widget> seatList = [];
  var numAssento;

  @override
  void initState() {
    super.initState();
    seatList = generateSeats(widget.ticketsList);
    print(seatList);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: .05 * constraints.maxHeight,
              ),
              Text(
                "Selecione o seu assento",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: .05 * constraints.maxHeight,
              ),
              Column(
                children: seatList,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> generateSeats(listTickets) {
    List<Widget> listSeats = [];

    List<Widget> x = [];

    for (var index = 0; index < listTickets.length; index++) {
      x.add(
        getSquare(listTickets[index]),
      );

      if (x.length == 3) {
        x.add(SizedBox(width: 30));
      }

      if (x.length == 7) {
        listSeats.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: x,
        ));
        x = [];
      }
    }

    while (x.length < 7) {
      x.add(
        Padding(
          padding: const EdgeInsets.all(6),
          child: SizedBox(
            height: 35,
            width: 35,
          ),
        ),
      );
    }

    listSeats.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: x,
    ));
    return listSeats;
  }

  Widget getSquare(TicketModel ticket) {
    return InkWell(
      onTap: () {
        if (ticket.idPassageiro == null) {
          Navigator.pop(context);
          widget.onSelected!(ticket);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: ticket.idPassageiro != null
                ? Color(0XFFFF7373)
                : ticket.squareColor,
          ),
          child: Center(
            child: Text(
              "${ticket.numeroAssento}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
