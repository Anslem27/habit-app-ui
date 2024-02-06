import 'package:flutter/material.dart';
import 'package:growing/app/models/habit.dart';
import 'package:growing/app/theme/app_theme.dart';

class SetHabitPrefeerences extends StatefulWidget {
  final Habit habit;
  const SetHabitPrefeerences({super.key, required this.habit});

  @override
  State<SetHabitPrefeerences> createState() => _SetHabitPrefeerencesState();
}

class _SetHabitPrefeerencesState extends State<SetHabitPrefeerences> {
  @override
  Widget build(BuildContext context) {
    List<String> habitChips = [
      "Study",
      "Home",
      "Work",
      "Pets",
      "Plants",
      "Car"
    ];

    Widget glassyContainer(int value, String type) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.05),
                Colors.transparent,
                Colors.transparent,
                Colors.white.withOpacity(0.05),
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.2),
              ],
              stops: const [0.0, 0.1, 0.2, 0.4, 0.6, 0.8, 0.9, 1.0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "back",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Text(
                          widget.habit.name.substring(0, 1).toUpperCase() +
                              widget.habit.name.substring(1),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const Text(
                          "Change",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5,
                      children: [
                        ...habitChips.map((material) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 23,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    material,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                            ),
                          );
                        }),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 12,
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.habit.name == "Productivity"
                      ? Column(
                          children: [
                            const SizedBox(height: 40),
                            _bodyCard(
                              glassyContainer,
                              AppTheme.babyBlue,
                              "Sleep",
                            ),
                            _bodyCard(
                              glassyContainer,
                              AppTheme.appColor,
                              "Work",
                            ),
                            _bodyCard(
                              glassyContainer,
                              AppTheme.fluidYellow,
                              "Work",
                            ),
                          ],
                        )
                      : widget.habit.name == "Personal Care"
                          ? Column(
                              children: [
                                const SizedBox(height: 40),
                                _personalPrefsCard(
                                  "Face",
                                  AppTheme.appColor,
                                  ["Cream", "Massage"],
                                ),
                                _personalPrefsCard(
                                  "Teeth",
                                  AppTheme.babyBlue,
                                  ["Brush", "Floss", "Whiten"],
                                ),
                                _personalPrefsCard(
                                  "Body",
                                  AppTheme.fluidYellow,
                                  ["Cream", "Massage"],
                                ),
                              ],
                            )
                          : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodyCard(Widget Function(int value, String type) glassyContainer,
      Color color, String title) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      "select days",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    glassyContainer(4, "hr"),
                    glassyContainer(30, "min"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _personalPrefsCard(String title, Color color, List<String> chipData) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      "select days",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 5.0,
                      runSpacing: 5,
                      children: [
                        ...chipData.map((chip) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 23,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    chip,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                            ),
                          );
                        }),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 12,
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
