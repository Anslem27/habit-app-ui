import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../theme/app_theme.dart';

class WorkOutElements extends StatefulWidget {
  const WorkOutElements({super.key});

  @override
  State<WorkOutElements> createState() => _WorkOutElementsState();
}

class _WorkOutElementsState extends State<WorkOutElements> {
  bool isChecked = true;

  Map<String, List<String>> components = {
    "Buttocks": ["Squats", "Lunges", "Squats with dumbells"],
    "Legs": ["Squats", "Jump rope", "Bike"],
    "Face": ["Massage", "Cream"],
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              ...components.entries
                  .map((e) => Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppTheme.mildBlack,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                                border: Border.all(
                                  color: AppTheme.mildBlack,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5.0,
                                        ),
                                        child: Text(
                                          e.key,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount: e.value.length,
                                        itemBuilder: (_, index) {
                                          return Row(
                                            children: [
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    100,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  e.value[index],
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
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
                              child: const Stack(
                                children: [
                                  Positioned(
                                    top: 1,
                                    right: 5,
                                    child: Icon(Icons.check),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}
