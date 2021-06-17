import '../models/data.dart';
import '../utils/shared_prefs.dart';
import 'package:provider/provider.dart';
import '../utils/constantes.dart';
import '../localization/language/languages.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';

class TabPlan extends StatefulWidget {
  final TipoPlan tipo;
  const TabPlan({required this.tipo});
  @override
  _TabPlanState createState() => _TabPlanState();
}

class _TabPlanState extends State<TabPlan> {
  final SharedPrefs _sharedPrefs = SharedPrefs();

  @override
  void initState() {
    _initSharedPrefs();
    super.initState();
  }

  Future<void> _initSharedPrefs() async => await _sharedPrefs.init();

  @override
  Widget build(BuildContext context) {
    var _myProvider = Provider.of<Data>(context);
    Languages lang = Languages.of(context);

    late int? plan;
    late int done;
    late int total;
    late double progress;
    late int planNoNull;
    late int countdownTotal;
    late String langLibre, langDone, langDones;
    late String escala;
    if (widget.tipo == TipoPlan.call) {
      setState(() {
        plan = _sharedPrefs.plan;
        planNoNull = plan ?? 200;
        done = _myProvider.timeCalls;
        total = _myProvider.totalCalls;
        progress = _myProvider.progress;
        countdownTotal = 500;
        langLibre = lang.minLibres;
        langDone = lang.callOutSingle;
        langDones = lang.callOut;
        escala = 'min';
      });
    } else {
      setState(() {
        plan = _sharedPrefs.planSms;
        planNoNull = plan ?? 1000;
        done = _myProvider.smsCount;
        total = _myProvider.smsCount;
        progress = _myProvider.progressSms;
        countdownTotal = 1000;
        langLibre = lang.smsLibres;
        langDone = lang.smsOutSingle;
        langDones = lang.smsOut;
        escala = 'SMS';
      });
    }

    String libre = () {
      if (planNoNull == 0) return '∞';
      if (done > planNoNull) return '0';
      return '${planNoNull - done}';
    }();

    Color color = () {
      if ((done * 100) / planNoNull < 50) return Colors.lightGreen;
      if ((done * 100) / planNoNull < 75) return Colors.orangeAccent;
      if (plan == 0) return Theme.of(context).backgroundColor;
      return Colors.redAccent;
    }();

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: CircularCountdown(
                  countdownTotal: planNoNull == 0 ? countdownTotal : planNoNull, // ?? 0,
                  countdownRemaining: done > planNoNull ? plan : done,
                  countdownRemainingColor: color,
                  diameter: MediaQuery.of(context).size.width * 0.60,
                  isClockwise: false,
                ),
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(libre, style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold)),
                      Text(langLibre),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Stack(
              children: [
                ClipRRect(
                  //borderRadius: const BorderRadius.all(Radius.circular(20)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    //backgroundColor: Colors.blueGrey[400], //cyanAccent,
                    backgroundColor: const Color(0xFF616161), //Colors.grey[700],
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 50.0,
                    value: done > planNoNull ? 1.0 : progress,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('$done $escala'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      plan != 0 ? '${((done * 100) / planNoNull).toStringAsFixed(0)} %' : '',
                      style: const TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(plan != 0 ? '$plan $escala' : '∞'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Chip(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              labelPadding: const EdgeInsets.all(10.0),
              //labelPadding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              backgroundColor: const Color(0xFF616161), // Colors.grey[700],
              avatar: CircleAvatar(
                backgroundColor: color,
                //radius: double.infinity,
                child: Text('$total', style: const TextStyle(color: Colors.white)),
              ),
              label: Container(
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(total == 1 ? langDone : langDones),
                ),
              ),
              deleteIcon: const Icon(Icons.list_alt, color: Color(0xFF80DEEA), size: 40),
              onDeleted: () => Navigator.of(context).pushNamed(idLogScreen, arguments: widget.tipo),
            ),
          ),
        ],
      ),
    );
  }
}
