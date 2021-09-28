import 'package:app_passagens_aereas/modules/login/login_cubit/login_state.dart';
import 'package:app_passagens_aereas/modules/create_account/models/create_account_model.dart';
import 'package:app_passagens_aereas/modules/create_account/service/create_account_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountCubit extends Cubit<LoginState> {
  CreateAccountCubit() : super(LoginState.init());

  postCreateAccount(CreateAccountModel createAccountModel) async {
    emit(LoginState.load());
    final data = await CreateAccountService().postAccount(createAccountModel);

    print(data is int);
    if (data is int) {
      emit(LoginState.success(data));
    } else {
      emit(LoginState.failed());
    }
  }
}
