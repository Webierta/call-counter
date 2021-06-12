import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/localizations_delegate.dart';
import 'models/data.dart';
import 'screens/call_screen.dart';
import 'screens/detalle_call.dart';
import 'screens/detalle_sms.dart';
import 'screens/settings_screen.dart';
import 'screens/info_screen.dart';
import 'screens/about_screen.dart';
import 'screens/donate_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Data(),
      child: Consumer<Data>(builder: (context, data, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizationsDelegate.supportedLocales,
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: Locale(data.lang),
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.blueGrey[800],
            accentColor: Colors.cyan[200],
            //colorScheme: ColorScheme.dark(primary: Colors.cyan[200]),
            colorScheme: ColorScheme.dark(primary: Color(0xFF80DEEA)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: data.minutosPlan == null ? SettingsScreen() : CallScreen(),
          routes: {
            CallScreen.id: (context) => CallScreen(),
            DetalleCall.id: (context) => DetalleCall(),
            DetalleSms.id: (context) => DetalleSms(),
            SettingsScreen.id: (context) => SettingsScreen(),
            Info.id: (context) => Info(),
            About.id: (context) => About(data.infoVersion),
            Donate.id: (context) => Donate(),
          },
        );
      }),
    );
  }
}
