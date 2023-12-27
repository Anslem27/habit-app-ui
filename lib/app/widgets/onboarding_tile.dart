import 'package:flutter/material.dart';
import 'package:growing/app/theme/app_theme.dart';

class OnboadTile extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final bool isChecked;
  final Color cardColor;
  const OnboadTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.isChecked,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                subtitle,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Icon(
                        icon,
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        isChecked
            ? Positioned(
                top: 1,
                right: 5,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: AppTheme.mildBlack,
                        offset: Offset(2, 2),
                      ),
                    ],
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.check),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
