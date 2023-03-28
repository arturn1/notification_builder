import 'package:flutter/material.dart';
import 'package:not_builder/second_view.dart';
import 'package:not_builder/themes/color_schemes.g.dart';

import 'base_controller.dart';
import 'counter_controller.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: BaseNotifier.instance.isDark,
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          themeMode: BaseNotifier.instance.getTheme(),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          home: const MyApp(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () => CounterNotifier.instance.increment(),
            child:
                Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () => CounterNotifier.instance.decrement(),
            child: const Icon(Icons.undo_rounded, color: Colors.white),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondView()),
            ),
            child:
                const Icon(Icons.navigate_next_outlined, color: Colors.white),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () {
              BaseNotifier.instance.setTheme();
              BaseNotifier.instance.saveThemeStatus();
            },
            child:
                const Icon(Icons.settings_input_component, color: Colors.white),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: CounterNotifier.instance.valueNotifier,
          builder: (context, value, child) {
            return Text(CounterNotifier.instance.getValueVN.toString());
          },
        ),
      ),
    );
  }
}
