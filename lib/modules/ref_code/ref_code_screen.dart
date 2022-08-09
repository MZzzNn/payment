import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment/core/resources/constants.dart';

class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ref Code')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You can go to market to pay',
                style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 10),
            Text('This is Reference Code',
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SelectableText(
                    Constants.REF_CODE,
                    style: Theme.of(context).textTheme.headline6,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                    icon: const Icon(Icons.content_copy),
                    splashRadius: 22,
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: Constants.REF_CODE));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
