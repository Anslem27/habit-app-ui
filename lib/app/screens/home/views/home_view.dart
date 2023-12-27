import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../models/habit.dart';
import '../../../theme/app_theme.dart';
import '../habits/habit_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController; 

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentDay();
    });
  }

  void _scrollToCurrentDay() {
    final now = DateTime.now();
    final today = now.weekday;
    final screenWidth = MediaQuery.of(context).size.width;
    final scrollToIndex = today - 1;
    final scrollToPosition = scrollToIndex * (screenWidth / 3);

    _scrollController.animateTo(
      scrollToPosition,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

/*   Widget? navpages() {
    switch ("habit") {
      case "hydrate":
        return const HydrateStats();

      default:
    }
    return null;
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mildBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 110,
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 7, // 7 days in a week
                    itemBuilder: (_, index) {
                      final now = DateTime.now();
                      final today = now.weekday;
                      final firstDayOfWeek =
                          now.subtract(Duration(days: today - 1));
                      final day = firstDayOfWeek.add(Duration(days: index));
                      final formattedDate = DateFormat('dd').format(day);

                      final bool isCurrentDay = index == today - 1;

                      return Container(
                        decoration: BoxDecoration(
                          color: isCurrentDay
                              ? Colors.white
                              : Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isCurrentDay
                                ? AppTheme.appColor
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        margin: const EdgeInsets.all(5.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${int.parse(formattedDate)}${_getOrdinalSuffix(int.parse(formattedDate))}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isCurrentDay ? Colors.black : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 7),
                              Icon(
                                PhosphorIcons.brain(),
                                color: isCurrentDay
                                    ? AppTheme.appColor
                                    : Colors.grey,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Image.asset(
                "assets/images/welcome.png",
                height: 280,
                fit: BoxFit.contain,
              ),
              const Text(
                "1%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Complete tasks and\nimprove your day",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white38,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Change"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HabitView(
                              // name-> workouts, hydrate, personalGrowth, steps, read, workouts
                              // different page view for individual habit
                              habit: Habit(
                                name: 'hydrate',
                                imageUrl: 'assets/images/hydrate.png',
                                content: const Text('Meditation content here'),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: index == 0
                            ? AppTheme.appColor
                            : index == 1
                                ? AppTheme.babyBlue
                                : index == 2
                                    ? AppTheme.fluidYellow
                                    : AppTheme.appColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3.0, horizontal: 12),
                                  child: Text(
                                    "Sleep",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              index == 0
                                  ? PhosphorIcons.moonStars()
                                  : index == 1
                                      ? PhosphorIcons.footprints()
                                      : index == 2
                                          ? PhosphorIcons.bookOpen()
                                          : PhosphorIcons.drop(),
                              size: 90,
                            ),
                            const ListTile(
                              title: Text(
                                "6hr 15min",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "1hr 45min less\nthan your norm",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _getOrdinalSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
