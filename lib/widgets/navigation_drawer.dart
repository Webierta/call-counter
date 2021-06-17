import '../utils/constantes.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemNavigator;
import '../localization/language/languages.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String _version = 'Unknown';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() => _version = info.version);
  }

  @override
  Widget build(BuildContext context) {
    Languages lang = Languages.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(color: Color(0xFF37474F)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 16.0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
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
                          const Text(
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
                              '${lang.version} $_version',
                              style: const TextStyle(fontSize: 12.0),
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
            leading: const Icon(Icons.info_outline),
            title: const Text('Info'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(idInfoScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: Text(lang.about),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(idAboutScreen, arguments: _version);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(lang.settings),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(idSettingsScreen);
            },
          ),
          const Divider(color: Color(0xFF9E9E9E)), //Colors.grey),
          ListTile(
            leading: const Icon(Icons.local_cafe_outlined),
            title: Text(lang.donar),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(idDonateScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(lang.exit),
            onTap: () {
              Navigator.of(context).pop();
              SystemNavigator.pop();
              //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
    );
  }
}
