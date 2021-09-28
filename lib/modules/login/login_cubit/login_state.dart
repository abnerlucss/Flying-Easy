import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState._(
    this.state, {
    this.idPassenger,
  });

  final int? idPassenger;
  final BasicStateEnum state;

  const LoginState.init() : this._(BasicStateEnum.init);

  const LoginState.load() : this._(BasicStateEnum.load);

  const LoginState.failed() : this._(BasicStateEnum.failed);

  const LoginState.success(int id)
      : this._(
          BasicStateEnum.success,
          idPassenger: id,
        );

  @override
  List<Object?> get props => [state, idPassenger];
}
