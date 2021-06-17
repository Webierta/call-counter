import '../utils/constantes.dart';
import '../widgets/tab_plan.dart';
import '../models/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/head_date.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool _syncroOn = false;

  syncroOn() async {
    setState(() => _syncroOn = true);
    await Future.delayed(Duration(seconds: 2));
    setState(() => _syncroOn = false);
  }

  @override
  Widget build(BuildContext context) {
    //var myProvider = Provider.of<Data>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Call Counter'),
          actions: [
            IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () {
                syncroOn();
                context.read<Data>().updateCallSms();
                //myProvider.updateCallSms();
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.of(context).pushNamed(idSettingsScreen),
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.phone_forwarded)),
            Tab(icon: Icon(Icons.sms)),
          ]),
        ),
        body: Column(
          children: [
            const HeadDate(),
            _syncroOn
                ? Expanded(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        child: CircularProgressIndicator(
                          strokeWidth: 20,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: TabBarView(
                      children: [
                        TabPlan(tipo: TipoPlan.call),
                        TabPlan(tipo: TipoPlan.sms),
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
