import 'package:app_passagens_aereas/modules/flight_details/models/image_model.dart';
import 'package:app_passagens_aereas/modules/flight_details/models/ticket_model.dart';
import 'package:app_passagens_aereas/modules/home/models/flight_model.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:equatable/equatable.dart';

class FlightDetailsState extends Equatable {
  const FlightDetailsState._({
    this.imageModel,
    required this.state,
    this.flight,
    this.ticketList,
  });

  final FlightModel? flight;
  final BasicStateEnum state;
  final List<TicketModel>? ticketList;
  final ImageModel? imageModel;

  const FlightDetailsState.init() : this._(state: BasicStateEnum.init);

  const FlightDetailsState.load() : this._(state: BasicStateEnum.load);

  const FlightDetailsState.failed() : this._(state: BasicStateEnum.failed);

  const FlightDetailsState.success(
      FlightModel flight, List<TicketModel>? ticketList, ImageModel imageModel)
      : this._(
          state: BasicStateEnum.success,
          flight: flight,
          ticketList: ticketList,
          imageModel: imageModel,
        );

  @override
  List<Object?> get props => [state, flight, ticketList, imageModel];
}
