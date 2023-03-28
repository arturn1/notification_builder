import 'package:flutter/material.dart';
import 'package:not_builder/fifth_view.dart';
import 'package:not_builder/main.dart';

import 'counter_controller.dart';


class FourthView extends StatelessWidget {
  const FourthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Counter counter = Counter();
    CounterController controller = CounterController.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quarta Tela'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, child) {
                return Text(counter.value.toString());
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
            ElevatedButton(
              onPressed: () => counter.increment(),
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
                MaterialPageRoute(builder: (context) => const FifthPage()),
              ),
              child: Text(controller.counter.toString()),
            ),

          ],
        ),
      ),
    );
  }
}
