import '../models/data.dart';
import 'package:provider/provider.dart';

import '../widgets/tab_sms.dart';
import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/tab_one.dart';
import '../widgets/head_date.dart';

class CallScreen extends StatelessWidget {
  static const String id = 'call_screen';

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Data>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Call Counter'),
          actions: [
            IconButton(
              icon: Icon(Icons.sync),
              onPressed: () => myProvider.updateCallSms(),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, SettingsScreen.id),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.phone_forwarded)),
              Tab(icon: Icon(Icons.sms)),
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
                  TabSms(),
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
