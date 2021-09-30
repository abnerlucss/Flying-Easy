import 'package:app_passagens_aereas/modules/home/home_cubit.dart/home_state.dart';
import 'package:app_passagens_aereas/modules/home/models/flight_model.dart';
import 'package:app_passagens_aereas/modules/home/models/passenger_model.dart';
import 'package:app_passagens_aereas/modules/home/service/tickets_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init());

  List<FlightModel>? flights;
  PassengerModel? passenger;

  getAllFlights() async {
    emit(HomeState.load());
    flights = await TicketsService().getAllFlights() ?? [];

    if (flights!.length != 0) {
      emit(HomeState.success(flights, passenger));
    } else {
      emit(HomeState.failed());
    }
  }

  getPassengerById(int id) async {
    emit(HomeState.load());
    passenger = await TicketsService().getPassengerById(id);

    if (passenger is PassengerModel) {
      emit(HomeState.success(flights, passenger));
    } else {
      emit(HomeState.failed());
    }
  }
}
