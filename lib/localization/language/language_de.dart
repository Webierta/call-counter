import 'languages.dart';

class LanguageDe extends Languages {
  // SettingsScreen
  @override
  String get settings => 'Einstellungen';
  @override
  String get labelSelectLanguage => 'App-Sprache';
  @override
  String get labelSliderPlan => 'Inklusivminuten im Anrufplan';
  @override
  String get labelSliderPlanSms => 'Anzahl der SMS im Nachrichtenplan';
  @override
  String get plan => 'Vertraglich vereinbarter Plan';
  @override
  String get planMensual => 'Monatlicher Plan';
  @override
  String get startDay => 'Starttag';
  @override
  String get fromDate => 'Von Datum';
  @override
  String get toDate => 'Bis Datum';
  @override
  String get customDate => 'Benutzerdefinierte Auswahl';
  @override
  String get getData => 'DATEN ABRUFEN';
  @override
  String get close => 'Schließen';
  @override
  String get unlimited => 'Unbegrenzt';
  @override
  String get errorRange => 'Fehler in der Datumsauswahl';
  @override
  String get errorDay => 'Starttag des monatlichen Plans überprüfen';
  @override
  String get snackBar => 'Einstellungen nicht gespeichert';

  // Drawer
  @override
  String get version => 'Version';
  @override
  String get about => 'Über';
  @override
  String get donar => 'Unterstützung';
  @override
  String get exit => 'App beenden';

  // Info
  @override
  String get textInfo => 'Call Counter wird verwendet, um den auf Ihrem Mobiltelefon '
      'abgeschlossenen Anruf- und SMS-Plan zu verwalten.\n\n'
      'Die App zeigt die verbrauchten Minuten der getätigten Anrufe und die Anzahl der gesendeten '
      'SMS-Nachrichten im aktuellen Monat (standardmäßig) oder in einem ausgewählten '
      'Abrechnungszyklus an. Es kann auch ein ausgewählter Datumsbereich abgefragt werden.\n\n'
      'Die App ist in Englisch, Deutsch und Spanisch verfügbar.';

  // About
  @override
  get licencia => 'Lizenz';
  @override
  String get source => 'Open Source';
  @override
  String get textAbout =>
      'Call Counter ist eine kostenlose und quelloffene Software für die Android '
      'Plattform.\n\nDer Quelltext ist auf Github einsehbar. Wenn Sie irgendwelce Probleme feststellen oder '
      'Sie möchten Verbesserungen vorschlagen, nutzen Sie den Link zur Projektseite auf Github:';
  @override
  String get privacidad => 'Datenschutz';
  @override
  String get textPrivacidad => 'Kostenlose Anwendung ohne Werbung.\n\n'
      'Diese App extrahiert oder sammelt weder Informationen über den Benutzer, '
      'noch verlangt sie seltsame Berechtigungen (benötigt nur die Berechtigung für '
      'den Zugriff auf das Anrufprotokoll). Desweiteren werden jegliche Mechanismen '
      'für Werbe- und Verfolgungszwecke abgelehnt.\n\n'
      'Diese Software ist frei von Spyware, Malware, Viren oder anderen Funktionen die '
      'Ihr Gerät angreifen oder Ihre Privatsphäre verletzen..';
  @override
  String get textLicencia => 'Diese App wird unter den Bedingungen von GNU General Public verteilt '
      ' Lizenz v.3 in der Hoffnung, dass es nützlich sein wird, allerdings OHNE GARANTIEN.\n\n'
      'Dieses Programm ist freie Software: Sie können Sie weiter verteilen und modifizieren unter den Bedingungen '
      ' der GNU General Public Lizenz veröffentlich von der Free Software Foundation, version 3 '
      '(GPLv3).\n\nDie GNU General Public Lizenz erlaubt es nicht, dass dieses Programm in proprietäre Programme '
      'integriert wird.\n\nFür mehr Informationen, besuchen Sie <https://www.gnu.org/licenses/>.';

  // Donar
  @override
  String get textDonate =>
      'Bei Call Counter handelt es sich um kostenlose und quelloffene Software. Bitte ziehen Sie '
      'eine Zusammenarbeit in Betracht, um die Entwicklung dieser App aktiv zu halten.\n\n'
      'Sie können die Entwicklung diese und anderer Anwendung mit einer kleinen Spende '
      'an meine Bitcoinadresse unterstützen oder per Paypal:';
  @override
  String get textPaypal => 'Über PayPal spenden (öffnet die PayPal-Zahlungsseite):';

// TAB ONE
  @override
  String get minLibres => 'Min. verfügbar';
  @override
  get callOut => 'Ausgehende Anrufe';
  @override
  get callOutSingle => 'Ausgehender Anruf';
  @override
  get detalleCall => 'Anrufdetails';

//TAB TWO
  @override
  String get noCalls => 'Keine ausgehenden Anrufe.';
  @override
  String get sec => 'Sek.';
  String get noSms => 'Keine SMS-Nachrichten gesendet.';
  @override
  String get smsLibres => 'SMS verfügbar';
  @override
  get smsOut => 'gesendeten nachrichten';
  @override
  get smsOutSingle => 'Nachricht gesendet';
  @override
  get detalleSms => 'SMS-Details';
}
