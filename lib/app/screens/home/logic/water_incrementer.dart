// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:growing/app/theme/app_theme.dart';

class HydrateStats extends StatefulWidget {
  const HydrateStats({super.key});

  @override
  _HydrateStatsState createState() => _HydrateStatsState();
}

class _HydrateStatsState extends State<HydrateStats> {
  int _waterMlCount = 0;
  double _progressValue = 0.0;
  final int _waterGoal = 8000; // Water intake goal in ml
  bool _goalReached = false;
  List<int> mlValues = [200, 300, 500, 700];

  void _updateWaterIntake(int ml) {
    setState(() {
      _waterMlCount += ml;
      _progressValue = _waterMlCount / _waterGoal;
      if (_progressValue > 1.0) {
        _progressValue = 1.0;
        _goalReached = true;
      } else {
        _goalReached = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$_waterMlCount mL',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 1),
                    Text("${_progressValue * 100}%")
                  ],
                ),
                // const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: _progressValue,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _goalReached
              ? const Text(
                  'Congratulations! Goal Achieved!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.mildBlack,
                  ),
                )
              : const SizedBox(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.add, size: 30),
                  ),
                ),
              ),
              ...mlValues.map((ml) {
                return GestureDetector(
                  onTap: () {
                    _updateWaterIntake(ml);
                  },
                  child: Container(
                    width: 70,
                    height: 60,
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
                              '$ml\nmL',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            /* 
                          Text(
                            '${(ml / _waterGoal * 100).round()}%',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ), */
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
