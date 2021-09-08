import 'package:app_passagens_aereas/modules/create_account/create_account_cubit/create_account_enum.dart';
import 'package:app_passagens_aereas/modules/create_account/models/create_account_model.dart';
import 'package:app_passagens_aereas/modules/create_account/service/create_account_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountCubit extends Cubit<CreateAccountEnum> {
  CreateAccountCubit() : super(CreateAccountEnum.init);

  postCreateAccount(CreateAccountModel createAccountModel) async {
    emit(CreateAccountEnum.load);
    final data = await CreateAccountService().postHttp(createAccountModel);

    print(data is int);
    if (data is int) {
      emit(CreateAccountEnum.success);
    } else {
      emit(CreateAccountEnum.failed);
    }
  }
}
