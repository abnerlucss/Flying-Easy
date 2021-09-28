import 'package:app_passagens_aereas/modules/login/login_cubit/login_state.dart';
import 'package:app_passagens_aereas/modules/login/models/login_model.dart';
import 'package:app_passagens_aereas/modules/login/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init());

  postLogin(LoginModel loginModel) async {
    emit(LoginState.load());
    final data = await LoginService().postLogin(loginModel);

    if (data is int) {
      emit(LoginState.success(data));
    } else {
      emit(LoginState.failed());
    }
  }
}
