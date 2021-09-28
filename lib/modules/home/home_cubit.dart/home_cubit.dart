import 'package:app_passagens_aereas/modules/home/home_cubit.dart/home_state.dart';
import 'package:app_passagens_aereas/modules/home/service/tickets_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init());

  getAllFlights() async {
    emit(HomeState.load());
    final List data = await TicketsService().getAllFlights() ?? [];

    if (data.length != 0) {
      emit(HomeState.success(data));
    } else {
      emit(HomeState.failed());
    }
  }
}
