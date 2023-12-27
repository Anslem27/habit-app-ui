// ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:growing/app/models/habit.dart';
import 'package:growing/app/screens/home/logic/water_incrementer.dart';
import 'package:growing/app/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../logic/personal_growth_chips.dart';
import '../logic/reading_logic.dart';
import '../logic/steps_counter.dart';
import '../logic/work_out_elements.dart';

class HabitView extends StatefulWidget {
  final Habit habit;
  const HabitView({Key? key, required this.habit}) : super(key: key);

  @override
  State<HabitView> createState() => _HabitViewState();
}

class _HabitViewState extends State<HabitView> {
  DateTime _selectedDate = DateTime.now();
  String _displayType = 'Day'; // Default value for content display

  void _goToPreviousDate() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
    });
  }

  void _goToNextDate() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
    });
  }

  void _goToPreviousMonth() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month - 1, _selectedDate.day);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month + 1, _selectedDate.day);
    });
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('d');
    final String day = formatter.format(date);

    final String suffix = _getDaySuffix(int.parse(day));

    final DateFormat monthFormatter = DateFormat('MMMM');
    final String month = monthFormatter.format(date);

    if (date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year) {
      return 'Today, $day$suffix $month';
    }
    return '$day$suffix $month';
  }

  String _getDaySuffix(int day) {
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

  // ignore: unused_element
  Widget _buildContent() {
    // Logic to determine what content to display based on the _displayType value
    switch (_displayType) {
      case 'Week':
        return Text('Content for a week starting from $_selectedDate');
      case 'Month':
        return Text(
            'Content for the month of ${DateFormat('MMMM y').format(_selectedDate)}');
      case 'Year':
        return Text('Content for the year ${_selectedDate.year}');
      default:
        return Text(
          'Content for ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
          style: const TextStyle(fontSize: 18),
        );
    }
  }

  Widget _buildHabitContent() {
    switch (widget.habit.name) {
      case "hydrate":
        return _buildHydrateWidgetBody();
      case "personalGrowth":
        return _buildPersonalGrowthWidget();
      case "steps":
        return _buildStepsWidgetBody();
      case "read":
        return _buildReadometerWidget();
      case "workouts":
        return _buildWorkoutsWidgetBody();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStepsWidgetBody() {
    return const StepCounter();
  }

  Widget _buildWorkoutsWidgetBody() {
    return const WorkOutElements();
  }

  Widget _buildReadometerWidget() {
    return const Readometer();
  }

  Widget _buildPersonalGrowthWidget() {
    return const Column(
      children: [
        Text(
          "60%",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            // fontWeight: FontWeight.bold,
          ),
        ),
        PersonalGrowthChips(),
      ],
    );
  }

  _buildHydrateWidgetBody() {
    return const Column(
      children: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.babyBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        PhosphorIcons.x(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Wrap(
                        spacing: 8.0,
                        children: [
                          ChoiceChip(
                            selectedColor: Colors.black,
                            label: const Text(
                              'Day',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            selected: _displayType == 'Day',
                            onSelected: (isSelected) {
                              setState(() {
                                _displayType = 'Day';
                              });
                            },
                          ),
                          ChoiceChip(
                            selectedColor: Colors.black,
                            disabledColor: Colors.white54,
                            label: const Text(
                              'Week',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            selected: _displayType == 'Week',
                            onSelected: (isSelected) {
                              setState(() {
                                _displayType = 'Week';
                              });
                            },
                          ),
                          ChoiceChip(
                            selectedColor: Colors.black,
                            label: const Text(
                              'Month',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            selected: _displayType == 'Month',
                            onSelected: (isSelected) {
                              setState(() {
                                _displayType = 'Month';
                              });
                            },
                          ),
                          ChoiceChip(
                            selectedColor: Colors.black,
                            disabledColor: Colors.blue[100],
                            label: const Text(
                              'Year',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            selected: _displayType == 'Year',
                            onSelected: (isSelected) {
                              setState(() {
                                _displayType = 'Year';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              switcherWidget(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    /* For debug purposes */
                    /* if (kDebugMode)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildContent(),
                      ), */
                    Image.asset(
                      widget.habit.imageUrl,
                      height: 280,
                      fit: BoxFit.contain,
                    ),
                    if (widget.habit.name == "hydrate") const HydrateStats(),
                    _buildHabitContent(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10),
                      child: Row(
                        children: [
                          specsCard(
                            "average\nper day",
                            2456,
                            PhosphorIcons.chartLineUp(),
                            () => null,
                          ),
                          const SizedBox(width: 10),
                          specsCard(
                            "the best for\nNovember",
                            70,
                            PhosphorIcons.flagBanner(),
                            () => null,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget specsCard(String title, int value, IconData icon, Function()? onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.mildBlack,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            icon,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${value.toString()} ${value > 200 ? "mL" : "%"}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget switcherWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          onPressed: _goToPreviousDate,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        IconButton(
          onPressed: _goToPreviousMonth,
          icon: const Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        Expanded(
          child: Text(
            _formatDate(_selectedDate),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        IconButton(
          onPressed: _goToNextMonth,
          icon: const Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
        IconButton(
          onPressed: _goToNextDate,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
