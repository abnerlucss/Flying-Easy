import 'package:app_passagens_aereas/modules/flight_details/flight_details_cubit/flight_details_state.dart';
import 'package:app_passagens_aereas/modules/flight_details/models/image_model.dart';
import 'package:app_passagens_aereas/modules/flight_details/models/ticket_model.dart';
import 'package:app_passagens_aereas/modules/flight_details/service/flight_details_service.dart';
import 'package:app_passagens_aereas/modules/home/models/flight_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightDetailsCubit extends Cubit<FlightDetailsState> {
  FlightDetailsCubit() : super(FlightDetailsState.init());

  FlightModel? flight;
  List<TicketModel>? ticketList;
  ImageModel? imageModel;

  getDataDetails(int idVoo, String flightClass, String destiny) async {
    emit(FlightDetailsState.load());
    flight = await FlightDetailsService().getFlightById(idVoo);
    await getTicketsByIdAndClass(idVoo, flightClass);
    await getLandscapeImageByFlightDestiny(destiny);

    if (flight != null) {
      emit(FlightDetailsState.success(flight!, ticketList, imageModel!));
    } else {
      emit(FlightDetailsState.failed());
    }
  }

  getTicketsByIdAndClass(int idVoo, String flightClass) async {
    emit(FlightDetailsState.load());

    ticketList =
        await FlightDetailsService().getTicketsByIdAndClass(idVoo, flightClass);
    print(ticketList);

    if (ticketList!.length != 0) {
      emit(FlightDetailsState.success(flight!, ticketList, imageModel!));
    } else {
      print("Empty list");
      emit(FlightDetailsState.failed());
    }
  }

  getLandscapeImageByFlightDestiny(String destiny) async {
    emit(FlightDetailsState.load());
    imageModel =
        await FlightDetailsService().getLandscapeImageByFlightDestiny(destiny);

    if (ticketList!.length != 0) {
      emit(FlightDetailsState.success(flight!, ticketList, imageModel!));
    } else {
      print("Empty list");
      emit(FlightDetailsState.failed());
    }
  }
}
