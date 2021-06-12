import 'package:call_counter/localization/language/language_en.dart';
import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages) ?? LanguageEn();
  }

  // SettingsScreen
  String get settings;
  String get labelSelectLanguage;
  String get labelSliderPlan;
  String get labelSliderPlanSms;
  String get plan;
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
  String get textPaypal;

  // TAB ONE
  String get minLibres;
  String get callOut;
  String get callOutSingle;
  String get detalleCall;

  // TAB TWO
  String get noCalls;
  String get sec;
  String get noSms;
  String get smsLibres;
  String get smsOut;
  String get smsOutSingle;
  String get detalleSms;
}
