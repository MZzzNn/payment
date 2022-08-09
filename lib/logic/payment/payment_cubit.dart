import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/resources/constants.dart';
import 'package:payment/data/data_sources/remote/dio_helper.dart';
import 'package:payment/data/data_sources/remote/end_points.dart';
import 'package:payment/logic/payment/payment_state.dart';



class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of<PaymentCubit>(context);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final priceController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  bool isLoading = false;
  void validateForm() async {
    isLoading = true;
    emit(PaymentLoadingState());
    if (formKey.currentState!.validate()) {
      getFirstToken();
    }else{
      emit(PaymentErrorState());
    }
    isLoading = false;
  }

  Future getFirstToken() async {
    DioHelperPayment.postData(
      url: EndPointsManger.AUTH,
      data: {"api_key": Constants.PAYMOB_API_KEY},
    ).then((value) {
      Constants.PAYMOB_FIRST_TOKEN = value.data['token'].toString();
      log('first token: ${Constants.PAYMOB_FIRST_TOKEN}');
      getOrderId();
    }).catchError((error) {
      emit(PaymentFirstTokenErrorState(error));
    });
  }

  Future getOrderId() async {
    DioHelperPayment.postData(
      url: EndPointsManger.ORDER_REGISTRATION,
      data: {
        "auth_token": Constants.PAYMOB_FIRST_TOKEN,
        "delivery_needed": "false",
        "amount_cents": priceController.text,
        "currency": "EGP",
      },
    ).then((value) {
      Constants.ORDER_ID = value.data['id'].toString();
      log('order id: ${Constants.ORDER_ID}');
      getFinalTokenCard();
    }).catchError((error) {
      emit(PaymentOrderIdErrorState(error));
    });
  }

  Future getFinalTokenCard() async {
    DioHelperPayment.postData(
      url: EndPointsManger.PAYMENT_KEY_REQUEST,
      data: {
        "auth_token": Constants.PAYMOB_FIRST_TOKEN,
        "amount_cents": priceController.text,
        "expiration": 3600,
        "order_id": Constants.ORDER_ID,
        "billing_data": {
          "apartment": "NA",
          "email": emailController.text,
          "floor": "NA",
          "first_name": firstNameController.text,
          "street": "NA",
          "building": "NA",
          "phone_number": phoneController.text,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastNameController.text,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": Constants.INTEGRATION_ID_CARD,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      Constants.FINAL_TOKEN_CARD = value.data['token'].toString();
      log('final token card: ${Constants.FINAL_TOKEN_CARD}');
      getFinalTokenKiosk();
    }).catchError((error) {
      emit(PaymentFinalTokenErrorState(error));
    });
  }


  Future getFinalTokenKiosk() async {
    DioHelperPayment.postData(
      url: EndPointsManger.PAYMENT_KEY_REQUEST,
      data: {
        "auth_token": Constants.PAYMOB_FIRST_TOKEN,
        "amount_cents": priceController.text,
        "expiration": 3600,
        "order_id": Constants.ORDER_ID,
        "billing_data": {
          "apartment": "NA",
          "email": emailController.text,
          "floor": "NA",
          "first_name": firstNameController.text,
          "street": "NA",
          "building": "NA",
          "phone_number": phoneController.text,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastNameController.text,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": Constants.INTEGRATION_ID_KIOSK,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      Constants.FINAL_TOKEN_KIOSK = value.data['token'].toString();
      log('final token kiosk: ${Constants.FINAL_TOKEN_KIOSK}');
      getRefCode();
    }).catchError((error) {
      emit(PaymentFinalTokenKioskErrorState(error));
    });
  }

  Future getRefCode() async {
    DioHelperPayment.postData(
      url: EndPointsManger.KIOSK_PAYMENTS,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR"
        },
        "payment_token": Constants.FINAL_TOKEN_KIOSK
      },
    ).then((value) {
      Constants.REF_CODE = value.data['id'].toString();
      log('ref code: ${Constants.REF_CODE}');
      emit(PaymentRefCodeSuccessState());
    }).catchError((error) {
      emit(PaymentRefCodeErrorState(error));
    });
  }


}
