import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show SystemNavigator;
import '../models/data.dart';
import '../screens/settings_screen.dart';
import '../screens/info_screen.dart';
import '../screens/about_screen.dart';
import '../screens/donate_screen.dart';
import '../localization/language/languages.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data _myProvider = Provider.of<Data>(context);
    Languages lang = Languages.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: Colors.blueGrey[800]),
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 16.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  left: 10.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/ic_launcher.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Call Counter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              '${lang.version} ${_myProvider.infoVersion}',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Info'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Info.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text(lang.about),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, About.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(lang.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsScreen.id);
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text(lang.donar),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Donate.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(lang.exit),
            onTap: () {
              Navigator.pop(context);
              SystemNavigator.pop();
              //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
    );
  }
}
