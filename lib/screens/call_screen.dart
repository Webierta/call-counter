import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/tab_one.dart';
import '../widgets/tab_two.dart';
import '../widgets/head_date.dart';

class CallScreen extends StatelessWidget {
  static const String id = 'call_screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Call Counter'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, SettingsScreen.id),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.timelapse)),
              Tab(icon: Icon(Icons.phone_forwarded)),
            ],
          ),
        ),
        body: Column(
          children: [
            HeadDate(),
            Expanded(
              child: TabBarView(
                children: [
                  TabOne(),
                  TabTwo(),
                ],
              ),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
      ),
    );
  }
}
