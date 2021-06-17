import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/localizations_delegate.dart';
import 'models/data.dart';
import 'models/data_lang.dart';
import 'route_generator.dart';
import 'utils/constantes.dart';
import 'utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPrefs _sharedPrefs = SharedPrefs();
  await _sharedPrefs.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Data()),
            ChangeNotifierProvider(create: (_) => DataLang()),
          ],
          child: MyApp(_sharedPrefs.plan),
        ),
      ));
}

class MyApp extends StatelessWidget {
  final int? plan;
  MyApp(this.plan);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizationsDelegate.supportedLocales,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('${context.watch<DataLang>().lang}'),
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
        primaryColor: const Color(0xFF37474F), //Colors.blueGrey[800],
        accentColor: const Color(0xFF80DEEA), //Colors.cyan[200],
        //colorScheme: ColorScheme.dark(primary: Colors.cyan[200]),
        colorScheme: ColorScheme.dark(primary: const Color(0xFF80DEEA)),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: plan == null ? idSettingsScreen : idCallScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
