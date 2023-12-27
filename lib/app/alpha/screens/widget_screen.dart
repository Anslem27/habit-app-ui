import 'package:flutter/material.dart';
import 'package:growing/app/widgets/app_button.dart';
import 'package:growing/app/widgets/app_header.dart';
import 'package:growing/app/widgets/onboarding_tile.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../theme/app_theme.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mildBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /* Buttons */
              AppButton(
                title: "Continue",
                color: Colors.white,
                textColor: Colors.black,
                onTap: () {},
              ),
              AppButton(
                title: "Continue",
                color: Colors.black,
                textColor: Colors.white,
                onTap: () {},
              ),
              const AppHeader(
                title: "Choose what you would like to make your habit",
                headerColor: Colors.white,
              ),
              OnboadTile(
                title: "Sports",
                subtitle: "Exercise to maintain daily physical activity",
                icon: PhosphorIcons.barbell(),
                isChecked: true,
                cardColor: AppTheme.appColor,
              ),
              OnboadTile(
                title: "Reading",
                subtitle: "Read to maintain daily mental activity",
                icon: PhosphorIcons.bookOpen(),
                isChecked: false,
                cardColor: AppTheme.fluidYellow,
              )
            ],
          ),
        ),
      ),
    );
  }
}
