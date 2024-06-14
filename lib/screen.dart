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
  int count = 0;
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;

  void increaseCount() {
    if (count < 9) {
      setState(() {
        count++;
      });
    } else if (count1 < 9) {
      setState(() {
        count = 0;
        count1++;
      });
    } else if (count2 < 9) {
      setState(() {
        count = 0;
        count1 = 0;
        count2++;
      });
    } else if (count3 < 9) {
      setState(() {
        count = 0;
        count1 = 0;
        count2 = 0;
        count3++;
      });
    }
  }

  void decreaseCount() {
    if (count == 0 && count1 == 0 && count2 == 0 && count3 == 0) {
      count = count1 = count2 = 0;
    } else if (count == 0) {
      if (count1 == 0) {
        if (count2 == 0) {
          if (count3 > 0) {
            setState(() {
              count3 = count3 - 1;
              count2 = 9;
              count1 = 9;
              count = 10;
              count--;
            });
          }
        } else if (count2 > 0) {
          setState(() {
            count2 = count2 - 1;
            count1 = 9;
            count = 10;
            count--;
          });
        }
      } else if (count1 > 0) {
        setState(() {
          count1 = count1 - 1;
          count = 10;
          count--;
        });
      }
    } else {
      setState(() {
        count--;
      });
    }
  }

  void reset() {
    setState(() {
      count = 0;
      count1 = 0;
      count2 = 0;
      count3 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);
    int countingCount =
        count + (count1 * 10) + (count2 * 100) + (count3 * 1000);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: 'settings-fab',
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
                    "$count3 $count2 $count1 $count",
                    style: TextStyle(
                      color: Colors.white,
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
                      onPressed: reset,
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
                        increaseCount();
                      } else {
                        Vibration.vibrate();
                      }
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Button(
                  count: decreaseCount,
                  icon: Icons.remove,
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
  Button({required this.count, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFF303030),
      radius: 90,
      child: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
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
