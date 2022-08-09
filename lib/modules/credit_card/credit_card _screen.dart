import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:payment/modules/register/register_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/resources/constants.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("https://accept.paymob.com/api/acceptance/iframes/390171?payment_token=${Constants.FINAL_TOKEN_CARD}");
    return Scaffold(
      appBar: AppBar(
          title: const Text('Credit Card'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const RegisterScreen()),(route) => false),
            ),
          ]
      ),
      body: WebView(
        initialUrl: "https://accept.paymob.com/api/acceptance/iframes/390171?payment_token=${Constants.FINAL_TOKEN_CARD}",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

}
