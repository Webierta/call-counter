import '../utils/constantes.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection' show UnmodifiableListView;
import 'call.dart';
import 'sms.dart';
import '../utils/shared_prefs.dart';

class Data with ChangeNotifier {
  // PREFERENCIAS
  final SharedPrefs _sharedPrefs = SharedPrefs();

  // FECHAS IN HEAD DATE
  int _to = DateTime.now().millisecondsSinceEpoch + 86400000;
  int _from = DateTime(DateTime.now().year, DateTime.now().month, 1).millisecondsSinceEpoch;
  int get fromDate => _from;
  int get toDate => _to;

  void setDates(int from, int to) {
    _from = from;
    _to = to;
    //_getCallLog();
    //_getSmsLog();
    notifyListeners();
  }

  set setPrefDia(int prefDia) {
    _sharedPrefs.dia = prefDia;
    /* int restaMes = (prefDia <= DateTime.now().day) ? 0 : 1;
    _from = DateTime(DateTime.now().year, DateTime.now().month - restaMes, prefDia)
        .millisecondsSinceEpoch; */
    _from = (prefDia <= DateTime.now().day)
        ? DateTime(DateTime.now().year, DateTime.now().month, prefDia).millisecondsSinceEpoch
        : DateTime(DateTime.now().year, DateTime.now().month - 1, prefDia).millisecondsSinceEpoch;
    _to = DateTime.now().millisecondsSinceEpoch + 86400000;
    //_getCallLog();
    //_getSmsLog();
    notifyListeners();
  }

  // CALL DATA
  Call? _call;
  List<LogCall> _logCall = <LogCall>[];
  UnmodifiableListView<LogCall> get logCalls => UnmodifiableListView(_logCall);
  int get logLength => _logCall.length;
  int _totalOut = 0;
  int get totalCalls => _totalOut;
  int _duracion = 0;
  int get timeCalls => _duracion;

  // SMS DATA
  Sms? _sms;
  List<LogSms> _logSms = <LogSms>[];
  UnmodifiableListView<LogSms> get logSms => UnmodifiableListView(_logSms);
  int get logLengthSms => _logSms.length;
  int _smsCount = 0;
  int get smsCount => _smsCount;

  // SCREEN SETTINGS
  int _sliderValor = 0;
  int get sliderValor => _sliderValor;
  int _sliderValorSms = 0;
  int get sliderValorSms => _sliderValorSms;

  set updateSlider(int value) {
    _sliderValor = value;
    notifyListeners();
  }

  set updateSliderSms(int value) {
    _sliderValorSms = value;
    notifyListeners();
  }

  String _dropdownValor = 'en';
  String get dropdownValor => _dropdownValor;
  set updateDropDown(String value) {
    _dropdownValor = value;
    notifyListeners();
  }

  int _diaField = 1;
  int get diaField => _diaField;
  set updateDiaField(int value) {
    _diaField = value;
    notifyListeners();
  }

  DateTime _fromDatePicked = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _toDatePicked = DateTime.now();
  DateTime get fromDatePicked => _fromDatePicked;
  DateTime get toDatePicked => _toDatePicked;

  void setFromDatePicked(DateTime date) {
    _fromDatePicked = date;
    notifyListeners();
  }

  void setToDatePicked(DateTime date) {
    _toDatePicked = date;
    notifyListeners();
  }

  CicloPlan _ciclo = CicloPlan.mensual;
  CicloPlan get ciclo => _ciclo;
  set ciclo(CicloPlan opcion) {
    _ciclo = opcion;
    notifyListeners();
  }

  // SCREEN MAIN
  double _progress = 0;
  double get progress => _progress;
  double _progressSms = 0;
  double get progressSms => _progressSms;

  void updateProgress() {
    if (_sharedPrefs.plan != null) {
      if (_sharedPrefs.plan == 0) {
        _progress = 0.0;
      } else if (_duracion > _sharedPrefs.plan!) {
        _progress = 1.0;
      } else {
        _progress = (_duracion / _sharedPrefs.plan!).toDouble();
      }
    }
    notifyListeners();
  }

  void updateProgressSms() {
    if (_sharedPrefs.planSms != null) {
      if (_sharedPrefs.planSms == 0) {
        _progressSms = 0.0;
      } else if (_smsCount > _sharedPrefs.planSms!) {
        _progressSms = 1.0;
      } else {
        _progressSms = (_smsCount / _sharedPrefs.planSms!).toDouble();
      }
    }
    notifyListeners();
  }

  Data() {
    _init();
  }

  _init() async {
    await _getData();
    await _getCallLog();
    await _getSmsLog();
  }

  Future<void> _getData() async {
    await _sharedPrefs.init();
    _sliderValor = _sharedPrefs.plan ?? 200;
    _sliderValorSms = _sharedPrefs.planSms ?? 1000;
    int _diaDate = _sharedPrefs.dia ?? 1;
    int _mesDate = _diaDate <= DateTime.now().day ? DateTime.now().month : DateTime.now().month - 1;
    _from = DateTime(DateTime.now().year, _mesDate, _diaDate).millisecondsSinceEpoch;
    _to = DateTime.now().millisecondsSinceEpoch + 86400000; // ??
    _dropdownValor = _sharedPrefs.lang ?? 'en';
    _diaField = _diaDate;
    notifyListeners();
  }

  Future<void> _getCallLog() async {
    _call = Call(_from, _to);
    await _call?.setCallLog();
    _call?.setCount();
    _totalOut = _call?.totalOut ?? 0;
    _duracion = Duration(seconds: _call?.duracion ?? 0).inMinutes;
    //_callLog = _call.callLog;
    _logCall = _call!.entriesCall;
    updateProgress();
    notifyListeners();
  }

  Future<void> _getSmsLog() async {
    _sms = Sms(_from, _to);
    await _sms?.setSmsLog();
    _sms?.setCountSms();
    _smsCount = _sms?.countSms ?? 0;
    _logSms = _sms!.entriesSms;
    updateProgressSms();
    notifyListeners();
  }

  void updateCallSms() async {
    await _getCallLog();
    await _getSmsLog();
  }
}
