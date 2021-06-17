import 'package:flutter/material.dart';
import 'screens/about_screen.dart';
import 'screens/call_screen.dart';
import 'screens/donate_screen.dart';
import 'screens/info_screen.dart';
import 'screens/log_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/constantes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case idCallScreen:
        return MaterialPageRoute(builder: (_) => CallScreen());
      case idLogScreen:
        if (args is TipoPlan) {
          return MaterialPageRoute(builder: (_) => LogScreen(tipo: args));
        }
        return _errorRoute();
      case idSettingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case idInfoScreen:
        return MaterialPageRoute(builder: (_) => Info());
      case idAboutScreen:
        if (args is String) {
          return MaterialPageRoute(builder: (_) => About(version: args));
        }
        return _errorRoute();
      case idDonateScreen:
        return MaterialPageRoute(builder: (_) => Donate());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Route not found')),
      );
    });
  }
}
