import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:growing/app/theme/app_theme.dart';

class GrowPageView extends StatefulWidget {
  const GrowPageView({Key? key}) : super(key: key);

  @override
  State<GrowPageView> createState() => _GrowPageViewState();
}

class _GrowPageViewState extends State<GrowPageView> {
  late String selectedMonth;
  final List<String> months =
      DateFormat.MMMM().dateSymbols.MONTHS; // Getting list of month names

  @override
  void initState() {
    super.initState();
    // Set the default selected month to the current month
    selectedMonth = DateFormat.MMMM().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mildBlack,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Grow",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _showMonthSelectionMenu(context);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedMonth,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
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
                  "assets/images/jar.png",
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  infoCard("Perfect days", 4, AppTheme.appColor),
                  infoCard("Good days", 5, AppTheme.babyBlue),
                  infoCard("Bad days", 7, Colors.grey.shade700),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(String header, int infoValue, Color cardColor) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        trailing: Text(
          infoValue.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
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

  void _showMonthSelectionMenu(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppTheme.babyBlue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: ListView(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (String month in months)
                    ListTile(
                      title: Text(month),
                      onTap: () {
                        setState(() {
                          selectedMonth = month;
                        });
                        Navigator.pop(context);
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
