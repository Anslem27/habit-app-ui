import 'package:flutter/material.dart';
import 'package:growing/app/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Map<String, int> goalData = {
    "Sleep": 37,
    "Steps": 20,
    "Water": 34,
    "Personal Care": 9
  };
  Widget goalSheet() {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: AppTheme.appColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Achieving the\ngoal.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "You've reached goal 102, keep up the good work.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ...goalData.entries.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(e.key),
                  trailing: Text(
                    e.value.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget dailyHabitSheet() {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: AppTheme.babyBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Daily habits",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Change",
                        style: TextStyle(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    habitCards(
                      AppTheme.appColor,
                      "Steps 8000",
                      PhosphorIcons.footprints(),
                    ),
                    habitCards(
                      Colors.white,
                      "Sleep 8h",
                      PhosphorIcons.moonStars(),
                    ),
                    habitCards(
                      AppTheme.fluidYellow,
                      "Reading 60min",
                      PhosphorIcons.bookOpen(),
                    ),
                    habitCards(
                      AppTheme.appColor,
                      "Drink 2000ml",
                      PhosphorIcons.drop(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget habitCards(Color color, String text, IconData icon) {
    return Card(
      color: color,
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mildBlack,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              PhosphorIcons.gear(),
              color: Colors.grey,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/avatar.png",
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const Text(
              "Sergey",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Change"),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      profileCard(
                        "daily habits",
                        2,
                        Icons.star_outline_rounded,
                        () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => dailyHabitSheet(),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      profileCard(
                        "achieved goals",
                        68,
                        Icons.golf_course_rounded,
                        () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => goalSheet(),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      profileCard(
                        "perfect days",
                        2,
                        PhosphorIcons.cloud(),
                        () {},
                      ),
                      const SizedBox(width: 10),
                      profileCard(
                        "days in the app",
                        56,
                        PhosphorIcons.sun(),
                        () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileCard(
      String title, int value, IconData icon, Function()? onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.fluidYellow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(icon, size: 90),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(title),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Icon(
                  PhosphorIcons.arrowUpRight(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
