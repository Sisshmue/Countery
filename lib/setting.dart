import 'package:counter_app/constants.dart';
import 'package:counter_app/counterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitch = true;
  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      backgroundColor:
          counterProvider.isSwitch == false ? k_lightbgColor : k_darkbgColor,
      appBar: AppBar(
        backgroundColor: counterProvider.isSwitch == false
            ? Color(0xFF90A955)
            : k_darkOutsiderContainer,
        title: Text(
          "Setting",
          style: TextStyle(
            color: counterProvider.isSwitch == false
                ? k_lightSettinngText
                : k_darkSetingText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "Set Count",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: counterProvider.isSwitch == false
                              ? k_lightSettinngText
                              : k_darkSetingText,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          var counterProvider = Provider.of<CounterProvider>(
                              context,
                              listen: false);
                          _showBottomSheet(context, counterProvider);
                        },
                        icon: Icon(
                          Icons.info_outline,
                          color: counterProvider.isSwitch == false
                              ? k_lightTestButton
                              : k_darkTestButton,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NumberPicker(
                    axis: Axis.horizontal,
                    minValue: 0,
                    maxValue: 9999,
                    itemHeight: 100,
                    itemCount: 3,
                    selectedTextStyle: TextStyle(
                      color: counterProvider.isSwitch == false
                          ? k_lightSettinngText
                          : k_darkSetingText,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textStyle: TextStyle(
                      color: counterProvider.isSwitch == false
                          ? k_lightSettinngText
                          : k_darkSetingText,
                    ),
                    value: counterProvider.setCount,
                    onChanged: (value) {
                      counterProvider.setSetCount(value);
                    },
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: counterProvider.isSwitch == false
                            ? k_lightNumberPickerborder
                            : k_darkNumberPickerborder,
                        width: 3,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          counterProvider.decrement();
                        },
                        icon: Icon(
                          Icons.remove,
                          color: counterProvider.isSwitch == false
                              ? k_lightIconColor
                              : k_darkIconColor,
                        ),
                      ),
                      Text(
                        'Set the count to: ${counterProvider.setCount}',
                        style: TextStyle(
                          fontSize: 20,
                          color: counterProvider.isSwitch == false
                              ? k_lightSettinngText
                              : k_darkSetingText,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          counterProvider.increment();
                        },
                        icon: Icon(
                          Icons.add,
                          color: counterProvider.isSwitch == false
                              ? k_lightIconColor
                              : k_darkIconColor,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Buttons(
                        text: 'Set',
                        function: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Buttons(
                        text: 'Reseet',
                        function: () {
                          counterProvider.setSetCount(0);
                        },
                      )
                    ],
                  ),

                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 350),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         Switch(
                  //             thumbIcon: MaterialStatePropertyAll(
                  //               Icon(
                  //                 Icons.mode_night_sharp,
                  //                 color: counterProvider.isSwitch == false
                  //                     ? k_lightSwitch
                  //                     : k_darkSwitch,
                  //               ),
                  //             ),
                  //             trackOutlineColor:
                  //                 MaterialStatePropertyAll(Colors.black12),
                  //             activeColor: Colors.white,
                  //             activeTrackColor: Colors.green,
                  //             inactiveTrackColor: Colors.black,
                  //             inactiveThumbColor: Color(0xFFEAEF9D),
                  //             value: counterProvider.isSwitch,
                  //             onChanged: (value) {
                  //               counterProvider.setSetSwitch(value);
                  //             })
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                      thumbIcon: MaterialStatePropertyAll(
                        Icon(
                          Icons.mode_night_sharp,
                          color: counterProvider.isSwitch == false
                              ? k_lightSwitch
                              : k_darkSwitch,
                        ),
                      ),
                      trackOutlineColor:
                          MaterialStatePropertyAll(Colors.black12),
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.black,
                      inactiveThumbColor: Color(0xFFEAEF9D),
                      value: counterProvider.isSwitch,
                      onChanged: (value) {
                        counterProvider.setSetSwitch(value);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, CounterProvider counterProvider) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
              child: Container(
            decoration: BoxDecoration(
              color: counterProvider.isSwitch == false
                  ? k_lightBottomSheet
                  : k_darkBottomsheet,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "You can set the specific amount of counts you want which will limi the counts and stops increasing.",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ));
        });
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final void Function() function;

  Buttons({required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return TextButton(
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
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
