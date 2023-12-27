import 'package:flutter/material.dart';
import 'package:growing/app/models/habit.dart';
import 'package:growing/app/screens/onboard/prefs/set_habit_prefs.dart';
import 'package:growing/app/screens/onboard/verify_habits.dart';
import 'package:growing/app/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../widgets/app_button.dart';
import '../../widgets/app_header.dart';

class PickHabitsScreen extends StatefulWidget {
  const PickHabitsScreen({super.key});

  @override
  State<PickHabitsScreen> createState() => _PickHabitsScreenState();
}

class _PickHabitsScreenState extends State<PickHabitsScreen> {
  final waterController = TextEditingController();
  final stepsController = TextEditingController();

  Widget dataSheet(String option) {
    return Padding(
      // hack to avoid keyboard overtaking bottomsheet
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  Text(
                    option.substring(0, 1).toUpperCase() + option.substring(1),
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
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "We have calculated the required ${option == "water" ? "amount of water" : "number of steps"} per day based on your physical parameters but you can adjust this yourself.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller:
                    option == "water" ? waterController : stepsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: option == "water" ? "2500" : "8000",
                  helperText: option == "water" ? "mL/day" : "steps/day",
                  fillColor: Colors.grey.shade500,
                  filled: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mildBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          Text(
            "Skip now",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const AppHeader(
              title: "Your habits",
              headerColor: Colors.white,
            ),
            const Text(
              "We have already calculated\nthe neccessary goals for your\nbody, but you can always set them for yourself.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white38,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
              child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    Card(
                      color: AppTheme.appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => dataSheet("water"),
                          );
                        },
                        title: const Text("Water"),
                        subtitle: const Text("2500ml"),
                        trailing: Icon(
                          PhosphorIcons.slidersHorizontal(),
                        ),
                      ),
                    ),
                    Card(
                      color: AppTheme.babyBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SetHabitPrefeerences(
                                habit: Habit(
                                  name: "Personal Care",
                                  imageUrl: "assets/images/happy.png",
                                  content: const SizedBox.shrink(),
                                ),
                              ),
                            ),
                          );
                        },
                        title: const Text("Personal Care"),
                        subtitle: const Text("Body(cream) and Face(cream)"),
                        trailing: Icon(
                          PhosphorIcons.slidersHorizontal(),
                        ),
                      ),
                    ),
                    Card(
                      color: AppTheme.fluidYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (_) => dataSheet("steps"),
                          );
                        },
                        title: const Text("Steps"),
                        subtitle: const Text("8000 steps"),
                        trailing: Icon(
                          PhosphorIcons.slidersHorizontal(),
                        ),
                      ),
                    ),
                    Card(
                      color: AppTheme.appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SetHabitPrefeerences(
                                habit: Habit(
                                  name: "Productivity",
                                  imageUrl: "assets/images/happy.png",
                                  content: const SizedBox.shrink(),
                                ),
                              ),
                            ),
                          );
                        },
                        title: const Text("Productivity"),
                        subtitle: const Text("Study-2hr (Monday-Friday)"),
                        trailing: Icon(
                          PhosphorIcons.slidersHorizontal(),
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  title: "Continue",
                  color: Colors.white,
                  textColor: Colors.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const VerifyHabitsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
