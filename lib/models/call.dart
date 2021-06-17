import 'package:call_log/call_log.dart';

class Call {
  final int _fromFecha;
  final int _toFecha;

  Call(this._fromFecha, this._toFecha);

  List<CallLogEntry> _callLog = <CallLogEntry>[];
  int _totalOut = 0;
  int _duracion = 0; // en segundos
  List<LogCall> _entriesCall = <LogCall>[];

  int get totalOut => _totalOut;
  int get duracion => _duracion;
  List<LogCall> get entriesCall => _entriesCall;

  Future<void> setCallLog() async {
    final Iterable<CallLogEntry> result = await CallLog.query(
      dateFrom: _fromFecha,
      dateTo: _toFecha,
      type: CallType.outgoing,
    );
    _callLog = result.toList();
    _setLogCall();
  }

  void setCount() {
    int totalLlamadas = 0;
    int duracionSec = 0;
    for (CallLogEntry entry in _callLog) {
      totalLlamadas++;
      duracionSec += entry.duration ?? 0;
    }
    _totalOut = totalLlamadas;
    _duracion = duracionSec;
  }

  void _setLogCall() {
    _callLog.forEach((entry) {
      _entriesCall.add(LogCall(
        number: entry.number.toString(),
        timestamp: entry.timestamp ?? 0,
        duration: entry.duration ?? 0,
      ));
    });
  }
}

class LogCall {
  final String number;
  final int timestamp;
  final int duration;

  LogCall({required this.duration, required this.timestamp, required this.number});
}
