import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  // SettingsScreen
  String get settings;
  String get labelSelectLanguage;
  String get labelSliderPlan;
  String get planMensual;
  String get startDay;
  String get fromDate;
  String get toDate;
  String get customDate;
  String get getData;
  String get close;
  String get unlimited;
  String get errorRange;
  String get errorDay;
  String get snackBar;

  // Drawer
  String get version;
  String get about;
  String get donar;
  String get exit;

  // Info
  String get textInfo;

  // About
  String get licencia;
  String get source;
  String get textAbout;
  String get privacidad;
  String get textPrivacidad;
  String get textLicencia;

  //Donate
  String get textDonate;

  // TAB ONE
  String get minLibres;
  String get callOut;

  // TAB TWO
  String get noCalls;
  String get sec;
}
