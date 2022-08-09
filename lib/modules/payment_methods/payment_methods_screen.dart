import 'package:flutter/material.dart';
import 'package:payment/core/components/default_button.dart';

import '../credit_card/credit_card _screen.dart';
import '../ref_code/ref_code_screen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Methods')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: ()=>setState(()=>_selectedIndex = 0),
                    child: Row(
                      children: [
                        const Icon(Icons.credit_card),
                        const SizedBox(width: 10),
                        const Text('Credit Card'),
                        const Spacer(),
                        Radio(
                          value: 0,
                          groupValue: _selectedIndex,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedIndex = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.1),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  InkWell(
                    onTap: ()=>setState(()=>_selectedIndex = 1),
                    child: Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(width: 10),
                        const Text('Reference Code'),
                        const Spacer(),
                        Radio(
                          value: 1,
                          groupValue: _selectedIndex,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedIndex = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            DefaultButton(
              text: 'Continue',
              onPressed: () {
                if(_selectedIndex == 0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreditCardScreen()));
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RefCodeScreen()));
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
