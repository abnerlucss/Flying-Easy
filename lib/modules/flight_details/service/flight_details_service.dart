import 'package:app_passagens_aereas/modules/flight_details/models/image_model.dart';
import 'package:app_passagens_aereas/modules/flight_details/models/ticket_model.dart';
import 'package:app_passagens_aereas/modules/flight_details/service/key.dart';
import 'package:app_passagens_aereas/modules/home/models/flight_model.dart';
import 'package:dio/dio.dart';

class FlightDetailsService {
  Future<FlightModel?> getFlightById(id) async {
    try {
      var response = await Dio().get(
        'https://msv-embarque.herokuapp.com/v1/voo/id/$id',
      );
      // print(response);

      return FlightModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<List<TicketModel>?> getTicketsByIdAndClass(id, flightClass) async {
    print(
        "Requisição: https://msv-passagem.herokuapp.com/v1/passagem/idVoo/$id/$flightClass");

    try {
      var response = await Dio().get(
        'https://msv-passagem.herokuapp.com/v1/passagem/idVoo/$id/$flightClass',
      );
      print(response);

      var data =
          List.from(response.data).map((e) => TicketModel.fromJson(e)).toList();

      print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<ImageModel?> getLandscapeImageByFlightDestiny(String destiny) async {
    print(destiny);
    try {
      var response = await Dio().get(
        'https://pixabay.com/api/?key=$apiKey&q=$destiny&image_type=photo&category=travel&orientation=horizontal&order=popular',
      );
      return ImageModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
