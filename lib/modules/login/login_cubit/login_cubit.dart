import 'package:app_passagens_aereas/modules/login/models/login_model.dart';
import 'package:app_passagens_aereas/modules/login/service/login_service.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/util/basic_state_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<BasicStateEnum> {
  LoginCubit() : super(BasicStateEnum.init);

  postLogin(LoginModel loginModel) async {
    emit(BasicStateEnum.load);
    final data = await LoginService().postHttp(loginModel);

    print(data is int);
    if (data is int) {
      emit(BasicStateEnum.success);
    } else {
      emit(BasicStateEnum.failed);
    }
  }
}
