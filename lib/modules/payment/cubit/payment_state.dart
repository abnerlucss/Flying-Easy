import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:equatable/equatable.dart';

class PaymentState extends Equatable {
  const PaymentState._(this.state);

  final BasicStateEnum state;

  const PaymentState.init() : this._(BasicStateEnum.init);

  const PaymentState.load() : this._(BasicStateEnum.load);

  const PaymentState.failed() : this._(BasicStateEnum.failed);

  const PaymentState.success() : this._(BasicStateEnum.success);

  @override
  List<Object?> get props => [state];
}
