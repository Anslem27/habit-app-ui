import 'package:flutter/material.dart';
import 'package:growing/app/theme/app_theme.dart';
import 'package:growing/app/screens/navigation.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../widgets/app_button.dart';
import '../../widgets/app_header.dart';

/* 
basal metabolic rate
The amount of energy your body needs to carry out its most basic functions ie breathing, and keeping
one's heart pumping.
Accounts for 60-70~ of the calories you burn each day.
 */
class BmrPage extends StatefulWidget {
  const BmrPage({super.key});

  @override
  State<BmrPage> createState() => _BmrPageState();
}

class _BmrPageState extends State<BmrPage> {
  @override
  Widget build(BuildContext context) {
    Widget infoCard(String header, String subtext, bool isHeartCard) {
      return Card(
        color: isHeartCard ? AppTheme.babyBlue : AppTheme.appColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          trailing: Text(
            "$subtext ${isHeartCard ? "BPM" : "kcal"}",
            style: const TextStyle(color: Colors.black),
          ),
          title: Text(
            header,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    Widget successDialog() {
      return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppTheme.appColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: Text(
                  "Your have\nconfigured",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Text(
                "Thank you for joinig us.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                "assets/images/welcome.png",
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppButton(
                    title: "Let's get started",
                    color: Colors.black,
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const AppHeader(
                title: "Your body\ndemands.",
                headerColor: Colors.white,
              ),
              const SizedBox(height: 50),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  trailing: const Text(
                    "1118 kcal/day",
                    style: TextStyle(color: Colors.black),
                  ),
                  title: const Text(
                    "BMR",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  leading: Icon(
                    PhosphorIcons.personSimpleRun(),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Activity level.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              infoCard("Very active", "more than 811", false),
              infoCard("Moderate activity", "419-811", false),
              infoCard("Light activity", "223-419", false),
              infoCard("Sedentary", "less than 223", false),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Heart rate training zone.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              infoCard("Peak", "166-196", true),
              infoCard("Cardio", "147-165", true),
              infoCard("Fat burning", "117-146", true),
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
                          builder: (_) => const NavigationScreen(),
                        ),
                      );

                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) => successDialog(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
