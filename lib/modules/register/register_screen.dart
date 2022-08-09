import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/components/default_button.dart';
import 'package:payment/core/components/default_form_field.dart';
import 'package:payment/modules/payment_methods/payment_methods_screen.dart';

import '../../logic/payment/payment_cubit.dart';
import '../../logic/payment/payment_state.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if(state is PaymentRefCodeSuccessState) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentMethodsScreen()));
          }
        },
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(title: const Text('Payment Integration')),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.1),
                      DefaultFormField(
                        controller: cubit.firstNameController,
                        type: TextInputType.name,
                        prefixIcon: Icons.person,
                        hintText: 'First Name',
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      DefaultFormField(
                        controller: cubit.lastNameController,
                        type: TextInputType.name,
                        prefixIcon: Icons.person,
                        hintText: 'Last Name',
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      DefaultFormField(
                        controller: cubit.emailController,
                        type: TextInputType.emailAddress,
                        prefixIcon: Icons.email,
                        hintText: 'Email',
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      DefaultFormField(
                        controller: cubit.phoneController,
                        type: TextInputType.phone,
                        prefixIcon: Icons.phone,
                        hintText: 'Phone',
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      DefaultFormField(
                        controller: cubit.priceController,
                        type: TextInputType.number,
                        prefixIcon: Icons.attach_money,
                        hintText: 'Price',
                        textInputAction: TextInputAction.done,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your price';
                          }
                          return null;
                        },
                        onSubmit: (String value) {
                          cubit.validateForm();
                        },
                      ),
                      const SizedBox(height: 40),
                      if (cubit.state is PaymentLoadingState) ...{
                        const Center(child: CircularProgressIndicator()),
                      } else ...{
                        DefaultButton(
                          onPressed: () {
                            cubit.validateForm();
                          },
                          text: 'Go to payment',
                        ),
                      }
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
