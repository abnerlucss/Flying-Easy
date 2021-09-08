import 'package:app_passagens_aereas/modules/shared/widgets/util/basic_state_enum.dart';
import 'package:app_passagens_aereas/modules/create_account/models/create_account_model.dart';
import 'package:app_passagens_aereas/modules/create_account/service/create_account_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountCubit extends Cubit<BasicStateEnum> {
  CreateAccountCubit() : super(BasicStateEnum.init);

  postCreateAccount(CreateAccountModel createAccountModel) async {
    emit(BasicStateEnum.load);
    final data = await CreateAccountService().postHttp(createAccountModel);

    print(data is int);
    if (data is int) {
      emit(BasicStateEnum.success);
    } else {
      emit(BasicStateEnum.failed);
    }
  }
}
