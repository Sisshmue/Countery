// import 'screen.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const Counter());
// }
//
// class Counter extends StatelessWidget {
//   const Counter({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeMode: ThemeMode.dark,
//       home: Screen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'screen.dart';

void main() {
  runApp(const Counter());
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
      home: const Screen(),
    );
  }
}
