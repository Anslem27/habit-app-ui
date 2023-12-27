import 'package:flutter/material.dart';
import 'package:growing/app/screens/onboard/bmr_page.dart';
import 'package:growing/app/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../widgets/app_button.dart';
import '../../widgets/onboarding_tile.dart';

class VerifyHabitsScreen extends StatefulWidget {
  const VerifyHabitsScreen({super.key});

  @override
  State<VerifyHabitsScreen> createState() => _VerifyHabitsScreenState();
}

class _VerifyHabitsScreenState extends State<VerifyHabitsScreen> {
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
        child: Column(children: [
          OnboadTile(
            title: "Reading",
            subtitle:
                "Read literature daily to\ngain new knowledge or\njust relax.",
            icon: PhosphorIcons.bookOpen(),
            isChecked: false,
            cardColor: AppTheme.fluidYellow,
          ),
          OnboadTile(
            title: "Personal Care",
            subtitle: "Take care of your face,\nteeth or body.",
            icon: PhosphorIcons.heartHalf(),
            isChecked: false,
            cardColor: AppTheme.babyBlue,
          ),
          OnboadTile(
            title: "Sports",
            subtitle: "Exercise to maintain daily physical activity",
            icon: PhosphorIcons.sneaker(),
            isChecked: true,
            cardColor: AppTheme.appColor,
          ),
          OnboadTile(
            title: "Healthy sleep",
            subtitle:
                "The required amount of sleep\nfor your body so that you\nfeel energetic the whole day.",
            icon: PhosphorIcons.bed(),
            isChecked: true,
            cardColor: AppTheme.fluidYellow,
          ),
          Card(
            color: AppTheme.appColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(3.0),
              child: ListTile(
                title: Text("Add a habit"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
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
                      builder: (_) => const BmrPage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
