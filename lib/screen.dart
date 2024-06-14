import 'package:provider/provider.dart';
import 'counterProvider.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);
    int countingCount = (counterProvider.count +
        (counterProvider.count1 * 10) +
        (counterProvider.count2 * 100) +
        (counterProvider.count3 * 1000)) as int;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: 'fab1',
          backgroundColor: Color(0xFF212121),
          child: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/setting');
          }),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF424242),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${counterProvider.count3} ${counterProvider.count2} ${counterProvider.count1} ${counterProvider.count}",
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 70,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 70,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xFF380E0E),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        counterProvider.reset();
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Button(
                    count: () {
                      if (countingCount < counterProvider.setCount ||
                          counterProvider.setCount == 0) {
                        counterProvider.increaseCount();
                      } else {
                        Vibration.vibrate();
                      }
                    },
                    icon: Icons.add,
                    heroTag: 'fab_add', // Unique heroTag
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Button(
                  count: () {
                    counterProvider.decreaseCount();
                  },
                  icon: Icons.remove,
                  heroTag: 'fab_remove', // Unique heroTag
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  late final void Function() count;
  late final IconData icon;
  final String heroTag;
  Button({required this.count, required this.icon, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFF303030),
      radius: 90,
      child: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          elevation: 10,
          heroTag: heroTag, // Use the unique heroTag here
          backgroundColor: Color(0xFF212121),

          onPressed: count,
          child: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
