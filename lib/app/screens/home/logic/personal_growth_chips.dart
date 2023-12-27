import 'package:flutter/material.dart';
import 'package:growing/app/theme/app_theme.dart';

import '../../../models/personal_growth_element.dart';

class PersonalGrowthChips extends StatefulWidget {
  const PersonalGrowthChips({super.key});

  @override
  State<PersonalGrowthChips> createState() => _PersonalGrowthChipsState();
}

class _PersonalGrowthChipsState extends State<PersonalGrowthChips> {
  /* Sample data */
  final List<PersonalGrowthComponent> personalGrowthComponents = [
    PersonalGrowthComponent(
      title: 'Study',
      subtitle: '2hr 14min',
      progress: 0.6, // Example progress value
    ),
    PersonalGrowthComponent(
      title: 'Work',
      subtitle: '1hr 30min',
      progress: 0.4, // Example progress value
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemCount: personalGrowthComponents.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:3.0),
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.mildBlack,width: 2),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          value: personalGrowthComponents[index].progress,
                          strokeWidth: 3,
                          backgroundColor: Colors.grey,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppTheme.mildBlack,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            personalGrowthComponents[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            personalGrowthComponents[index].subtitle,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
