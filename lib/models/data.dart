import 'package:flutter/foundation.dart';
import 'dart:collection' show UnmodifiableListView;
import 'call.dart';
import '../utils/shared_prefs.dart';
import '../utils/package_info.dart';

enum CicloPlan { mensual, custom }

class Data extends ChangeNotifier {
  // preferencias
  final SharedPrefs _sharedPrefs = SharedPrefs();
  int _from = DateTime(DateTime.now().year, DateTime.now().month, 1).millisecondsSinceEpoch;

  // call data
  Call _call;
  //List<CallLogEntry> _callLog = <CallLogEntry>[];
  List<LogCall> _logCall = <LogCall>[];

  int _totalOut = 0;
  int _duracion = 0;
  int _to = DateTime.now().millisecondsSinceEpoch + 86400000;

  // screen settings
  int _sliderValor = 0;
  String _dropdownValor = 'en';
  int _diaField = 1;
  DateTime _fromDatePicked = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _toDatePicked = DateTime.now();
  CicloPlan _ciclo = CicloPlan.mensual;

  // screen Call
  double _progress = 0;

  //packageInfo
  final PackInfo _packInfo = PackInfo();

  Data() {
    _getData();
    _getCallLog();
    _getPackInfo();
  }

  void _getData() async {
    await _sharedPrefs.init();
    _sliderValor = _sharedPrefs.plan ?? 200;
    _from = DateTime(DateTime.now().year, DateTime.now().month, _sharedPrefs.dia ?? 1)
        .millisecondsSinceEpoch;
    _to = DateTime.now().millisecondsSinceEpoch + 86400000; // ??
    _dropdownValor = _sharedPrefs.lang ?? 'en';
    _diaField = _sharedPrefs.dia ?? 1;
    notifyListeners();
  }

  void _getCallLog() async {
    _call = Call(_from, _to);
    await _call.setCallLog();
    _call.setCount();
    _totalOut = _call.totalOut;
    _duracion = Duration(seconds: _call.duracion).inMinutes;
    //_callLog = _call.callLog;
    _logCall = _call.entriesCall;
    updateProgress();
    notifyListeners();
  }

  void _getPackInfo() async {
    await _packInfo.init();
  }

  String get infoVersion => _packInfo.version;

  set setPrefPlan(int prefPlan) {
    _sharedPrefs.plan = prefPlan;
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
    _getCallLog();
    notifyListeners();
  }

  void setDates(int from, int to) {
    _from = from;
    _to = to;
    _getCallLog();
    notifyListeners();
  }

  String get lang => _sharedPrefs.lang ?? 'en';

  set setPrefLang(String prefLang) {
    _sharedPrefs.lang = prefLang;
    notifyListeners();
  }

  String get dropdownValor => _dropdownValor;

  set updateDropDown(String value) {
    _dropdownValor = value;
    notifyListeners();
  }

  int get minutosPlan => _sharedPrefs.plan; // ?? 200;

  int get sliderValor => _sliderValor;

  set updateSlider(int value) {
    _sliderValor = value;
    notifyListeners();
  }

  double get progress => _progress;

  void updateProgress() {
    if (_sharedPrefs.plan != null) {
      if (_sharedPrefs.plan == 0) {
        _progress = 0.0;
      } else if (_duracion > _sharedPrefs.plan) {
        _progress = 1.0;
      } else {
        _progress = (_duracion / _sharedPrefs.plan)?.toDouble();
      }
    }
    notifyListeners();
  }

  int get diaField => _diaField;

  set updateDiaField(int value) {
    _diaField = value;
    notifyListeners();
  }

  int get diaD => _sharedPrefs.dia;

  int get fromDate => _from;

  int get toDate => _to;

  int get totalCalls => _totalOut;

  int get timeCalls => _duracion;

  //UnmodifiableListView<CallLogEntry> get calls => UnmodifiableListView(_callLog);
  UnmodifiableListView<LogCall> get logCalls => UnmodifiableListView(_logCall);

  //int get callsLength => _callLog.length;
  int get logLength => _logCall.length;

  CicloPlan get ciclo => _ciclo;

  set ciclo(CicloPlan opcion) {
    _ciclo = opcion;
    notifyListeners();
  }

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
}
