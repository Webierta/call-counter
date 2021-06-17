import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class Sms {
  final int _fromFecha;
  final int _toFecha;

  Sms(this._fromFecha, this._toFecha);

  List<SmsMessage> _messages = <SmsMessage>[];
  int _countSms = 0;
  List<LogSms> _entriesSms = <LogSms>[];

  int get countSms => _countSms;
  List<LogSms> get entriesSms => _entriesSms;

  Future<void> setSmsLog() async {
    SmsQuery _query = SmsQuery();
    var messagesSent = await _query.querySms(kinds: [SmsQueryKind.Sent]);
    DateTime fecha1 = DateTime.fromMillisecondsSinceEpoch(_fromFecha);
    DateTime fecha2 = DateTime.fromMillisecondsSinceEpoch(_toFecha);
    for (var sms in messagesSent) {
      if (sms.date!.isBefore(fecha2) && sms.date!.isAfter(fecha1)) {
        _messages.add(sms);
      }
    }
    _setLogSms();
  }

  void _setLogSms() {
    _messages.forEach((entry) {
      _entriesSms.add(LogSms(
        number: entry.address ?? '',
        date: entry.date ?? DateTime.now(),
      ));
    });
  }

  void setCountSms() {
    _countSms = _messages.length;
  }
}

class LogSms {
  final String number;
  final DateTime date;

  LogSms({required this.number, required this.date});
}
