import 'package:flutter/material.dart';

class StepCounter extends StatefulWidget {
  const StepCounter({super.key});

  @override
  State<StepCounter> createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  Map<String, String> data = {
    "distance": "350m",
    "floors": "${2}",
    "calories": "${67}"
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "1254",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            // fontWeight: FontWeight.bold,
          ),
        ),
        const Text("of 8000 steps"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...data.entries
                .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 8),
                  child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 90,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${e.value}\n${e.key}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                ))
                
          ],
        )
      ],
    );
  }
}
