import 'languages.dart';

class LanguageEn extends Languages {
  // SettingsScreen
  @override
  String get settings => 'Settings';
  @override
  String get labelSelectLanguage => 'App language';
  @override
  String get labelSliderPlan => 'Calling plan minutes';
  @override
  String get labelSliderPlanSms => 'Number of SMS in the message plan';
  @override
  String get plan => 'Contracted plan';
  @override
  String get planMensual => 'Monthly plan';
  @override
  String get startDay => 'Start day';
  @override
  String get fromDate => 'From date';
  @override
  String get toDate => 'To date';
  @override
  String get customDate => 'Custom date range';
  @override
  String get getData => 'GET DATA';
  @override
  String get close => 'Close';
  @override
  String get unlimited => 'Unlimited';
  @override
  String get errorRange => 'Error in date range';
  @override
  String get errorDay => 'Check the starting day of the monthly plan';
  @override
  String get snackBar => 'Settings not saved';

  // Drawer
  @override
  String get version => 'Version';
  @override
  String get about => 'About';
  @override
  String get donar => 'Support';
  @override
  String get exit => 'Exit App';

  // Info
  @override
  String get textInfo => 'Call Counter helps to manage the call and SMS plan contracted '
      'on your mobile phone.\n\n'
      'The App display the minutes consumed by outgoing calls and the number of SMS messages sent '
      'in the current month (by default) or in a selected billing cycle. A selected range of dates '
      'can also be queried.\n\n'
      'The App is available in English, German and Spanish.';

  // About
  @override
  get licencia => 'License';
  @override
  String get source => 'Open Source';
  @override
  String get textAbout => 'Call Counter is Free and Open Source Software for the Android '
      'platform.\n\nSource code on Github. If you experience any problems or want to request an '
      'improvement, use this link to the project page on Github:';
  @override
  String get privacidad => 'Privacy';
  @override
  String get textPrivacidad => 'Free application without advertising.\n\n'
      'This app does not extract or store any user information '
      'nor does it require any strange permission (only permission '
      'to access the call history log), and it disclaims advertising '
      'and any tracking mechanism.\n\n'
      'Software free of spyware, malware, viruses or any process that '
      'attacks your device or violates your privacy.';
  @override
  String get textLicencia => 'This app is shared under the terms of the GNU General Public '
      ' License v.3 in the hope that it will be useful, but WITHOUT ANY WARRANTY.\n\n'
      'This program is free software: you can redistribute and modify it under the terms '
      'of the GNU General Public License published by the Free Software Foundation, version 3 '
      '(GPLv3).\n\nThe GNU General Public License does not allow this program to be incorporated '
      'into proprietary programs.\n\nFor more information, see <https://www.gnu.org/licenses/>.';

  // Donar
  @override
  String get textDonate => 'Call Counter is Free and Open Source Software. '
      'Please consider collaborating to keep the development of this App active.\n\n'
      'You can support the development of this and other applications with a small contribution '
      'to my Bitcoins wallet or via Paypal:';
  @override
  String get textPaypal => 'Donate vía PayPal (open the PayPal payment website):';

// TAB ONE
  @override
  String get minLibres => 'min. free';
  @override
  get callOut => 'outgoing calls';
  @override
  get callOutSingle => 'outgoing call';
  @override
  get detalleCall => 'Call details';

//TAB TWO
  @override
  String get noCalls => 'No outgoing calls.';
  @override
  String get sec => 'sec.';
  String get noSms => 'No SMS messages sent.';
  @override
  String get smsLibres => 'SMS free';
  @override
  get smsOut => 'sent messages';
  @override
  get smsOutSingle => 'sent message';
  @override
  get detalleSms => 'SMS detail ';
}
