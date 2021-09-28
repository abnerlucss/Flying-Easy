import 'package:app_passagens_aereas/modules/home/models/flight_model.dart';
import 'package:dio/dio.dart';
// import 'package:app_passagens_aereas/modules/home/models/ticket_model.dart';

class TicketsService {
  Future<List<FlightModel>?> getAllFlights() async {
    try {
      var response = await Dio().get(
        'https://msv-embarque.herokuapp.com/v1/voo/',
      );
      print(response);
      return List.from(response.data)
          .map((e) => FlightModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
