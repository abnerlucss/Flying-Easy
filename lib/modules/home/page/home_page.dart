import 'package:app_passagens_aereas/modules/home/home_cubit.dart/home_cubit.dart';
import 'package:app_passagens_aereas/modules/home/home_cubit.dart/home_state.dart';
import 'package:app_passagens_aereas/modules/home/widget/home_drawer_widget.dart';
import 'package:app_passagens_aereas/modules/home/widget/ticket_card_widget.dart';
import 'package:app_passagens_aereas/modules/shared/constants/color_constants.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.idPassenger}) : super(key: key);

  final int idPassenger;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeCubit>(context).getAllFlights();
    BlocProvider.of<HomeCubit>(context).getPassengerById(widget.idPassenger);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        checkState(state, context);
      },
      builder: (context, state) {
        if (state.state == BasicStateEnum.load) {
          return load();
        }

        final list = state.flights;
        final passenger = state.passengerModel;
        return Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          appBar: AppBar(
            backgroundColor: Color(ColorConstants.darkPrimaryBlue),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.search,
                  size: 32,
                ),
              ),
            ],
          ),
          drawer: HomeDrawerWidget(
            passengerModel: passenger!,
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final flight = list[index];
              return Center(
                child: TicketCardWidget(
                  idPassenger: widget.idPassenger,
                  flightModel: flight,
                ),
              );
            },
            itemCount: list.length,
          ),
        );
      },
    );
  }
}

void checkState(HomeState state, BuildContext context) {
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
