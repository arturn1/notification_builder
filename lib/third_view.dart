import 'package:flutter/material.dart';
import 'package:not_builder/fourth_view.dart';
import 'package:not_builder/main.dart';

import 'counter_controller.dart';


class ThirdView extends StatelessWidget {
  const ThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CounterNotifier counterNotifier = CounterNotifier.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terceira Tela'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: counterNotifier.valueNotifier,
              builder: (context, value, child) {
                return Text(counterNotifier.getValueVN.toString());
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
            ElevatedButton(
              onPressed: () => counterNotifier.increment(),
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              ),
              child: const Icon(Icons.home),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FourthView()),
              ),
              child: const Icon(Icons.four_g_mobiledata),
            ),
          ],
        ),
      ),
    );
  }
}
