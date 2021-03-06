import 'package:app_passagens_aereas/modules/home/models/flight_model.dart';
import 'package:app_passagens_aereas/modules/home/models/passenger_model.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState._({
    required this.state,
    this.passengerModel,
    this.flights = const [],
  });

  final List<FlightModel> flights;
  final PassengerModel? passengerModel;
  final BasicStateEnum state;

  const HomeState.init() : this._(state: BasicStateEnum.init);

  const HomeState.load() : this._(state: BasicStateEnum.load);

  const HomeState.failed() : this._(state: BasicStateEnum.failed);

  const HomeState.success(flights, passengerModel)
      : this._(
          state: BasicStateEnum.success,
          flights: flights,
          passengerModel: passengerModel,
        );

  @override
  List<Object?> get props => [state, flights, passengerModel];
}
