import 'package:counter_app/counterProvider.dart';
import 'package:counter_app/setting.dart';
import 'package:flutter/material.dart';
import 'screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
    child: Counter(),
  ));
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Screen(),
        '/setting': (context) => Setting(),
      },
    );
  }
}
