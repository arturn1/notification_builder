import 'package:flutter/material.dart';
import 'package:not_builder/third_view.dart';

import 'counter_controller.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Tela'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: CounterNotifier.instance.valueNotifier,
              builder: (context, value, child) {
                return Text(CounterNotifier.instance.getValueVN.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Go back!'
            ),
          ),
          ElevatedButton(
            onPressed: () => CounterNotifier.instance.increment(),
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdView()),
            ),
            child: const Icon(Icons.threed_rotation_outlined),
          ),
        ],
      ),
    );
  }
}
