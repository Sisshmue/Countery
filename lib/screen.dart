import 'package:provider/provider.dart';
import 'counterProvider.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'constants.dart';

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
      backgroundColor:
          counterProvider.isSwitch == false ? k_lightbgColor : k_darkbgColor,
      floatingActionButton: FloatingActionButton(
          heroTag: 'fab1',
          backgroundColor: counterProvider.isSwitch == false
              ? k_lightSettingButton
              : k_darkSettingButton,
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
                  color: counterProvider.isSwitch == false
                      ? k_lightOutsideContainer
                      : k_darkOutsiderContainer,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: counterProvider.isSwitch == false
                        ? k_lightInsideContainer
                        : k_darkInsideContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${counterProvider.count3} ${counterProvider.count2} ${counterProvider.count1} ${counterProvider.count}",
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
                          counterProvider.isSwitch == false
                              ? k_lightTestButton
                              : k_darkTestButton,
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
    var counterProvider = Provider.of<CounterProvider>(context);
    return CircleAvatar(
      backgroundColor: counterProvider.isSwitch == false
          ? kligthCircleColor
          : kdarkCircleColor,
      radius: 90,
      child: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          elevation: 10,
          heroTag: heroTag, // Use the unique heroTag here
          backgroundColor: counterProvider.isSwitch == false
              ? k_lightfab_BgColor
              : k_darkfab_BgColor,

          onPressed: count,
          child: Icon(
            icon,
            size: 40,
            color: counterProvider.isSwitch == false
                ? k_lightIconColor
                : k_darkIconColor,
          ),
        ),
      ),
    );
  }
}
