import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class Sms {
  final int _fromFecha;
  final int _toFecha;

  Sms(this._fromFecha, this._toFecha);

  //SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = <SmsMessage>[];
  int _countSms = 0;

  List<LogSms> _entriesSms = <LogSms>[];

  int get countSms => _countSms;
  List<LogSms> get entriesSms => _entriesSms;

  /*getSmsAll() async {
    _messages = await _query.getAllSms;
  }*/

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

  /*getSmsSent() async {
    SmsQuery _query = SmsQuery();
    _messages = await _query.querySms(kinds: [SmsQueryKind.Sent]);
  }*/

  /*getSmsDate() async {
    //final DateFormat formatoFecha = DateFormat.yMMMd(myProvider.lang);
    for (var sms in _messages) {
      //var fechaSms = DateTime.fromMillisecondsSinceEpoch(sms.dateSent);
      print(sms.date?.millisecondsSinceEpoch);
    }
  }*/

  /*getSmsNumber() async {
    for (var sms in _messages) {
      //var fechaSms = DateTime.fromMillisecondsSinceEpoch(sms.dateSent);
      print(sms.address);
    }
  }*/

  /*Future<void> getCountSms() async {
    await getSmsSent();
    // 2021-06-10 19:58:50.113
    // 2021-06-10 19:55:00.322
    // 1623347930113
    // 1623347700322
    await getSmsDate();
    //await getSmsNumber();
    _countSms = _messages.length;
  }*/
}

class LogSms {
  final String number;
  final DateTime date;

  LogSms({required this.number, required this.date});
}
