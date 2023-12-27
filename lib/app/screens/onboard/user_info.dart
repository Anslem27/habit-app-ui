import 'package:flutter/material.dart';
import 'package:growing/app/theme/app_theme.dart';
import 'package:growing/app/widgets/app_header.dart';

import '../../widgets/app_button.dart';
import 'pick_habits.dart';

class GetUserInfo extends StatefulWidget {
  const GetUserInfo({super.key});

  @override
  State<GetUserInfo> createState() => _GetUserInfoState();
}

class _GetUserInfoState extends State<GetUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: AppTheme.mildBlack,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const AppHeader(
              title: "Tell us a little about yourself",
              headerColor: Colors.white,
            ),
            const Text(
              "This way we can\ncalculate the norms \nfor your physical condition",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white38,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.appColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      /* get user name */
                      Card(
                        color: Colors.pink[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: ListTile(
                            title: Text("Name"),
                            trailing: Text(
                              "Your name",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      /*  */
                      Card(
                        color: Colors.pink[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: ListTile(
                            title: Text("Age"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                      Card(
                        color: AppTheme.appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: ListTile(
                            title: Text("Gender"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                      Card(
                        color: AppTheme.babyBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: ListTile(
                            title: Text("Height"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.blue[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: ListTile(
                            title: Text("Weight"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        builder: (_) => const PickHabitsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
