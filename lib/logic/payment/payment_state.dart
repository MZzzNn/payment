
abstract class PaymentState {}
class PaymentInitialState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}
class PaymentErrorState extends PaymentState {}

class PaymentFirstTokenErrorState extends PaymentState {
  final String error;
  PaymentFirstTokenErrorState(this.error);
}

class PaymentOrderIdErrorState extends PaymentState {
  final String error;
  PaymentOrderIdErrorState(this.error);
}

class PaymentFinalTokenErrorState extends PaymentState {
  final String error;
  PaymentFinalTokenErrorState(this.error);
}


class PaymentFinalTokenKioskErrorState extends PaymentState {
  final String error;
  PaymentFinalTokenKioskErrorState(this.error);
}

class PaymentRefCodeSuccessState extends PaymentState {}
class PaymentRefCodeErrorState extends PaymentState {
  final String error;
  PaymentRefCodeErrorState(this.error);
}