import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:circular_countdown/circular_countdown.dart';
import '../models/data.dart';
import '../localization/language/languages.dart';

class TabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Data>(context);
    Languages lang = Languages.of(context);

    String minutosLibres = () {
      if (myProvider.minutosPlan == 0) return '∞';
      if (myProvider.timeCalls > myProvider.minutosPlan) return '0';
      return '${myProvider.minutosPlan - myProvider.timeCalls}';
    }();

    Color color = () {
      if ((myProvider.timeCalls * 100) / myProvider.minutosPlan < 50) return Colors.lightGreen;
      if ((myProvider.timeCalls * 100) / myProvider.minutosPlan < 75) return Colors.orangeAccent;
      if (myProvider.minutosPlan == 0) return Theme.of(context).backgroundColor;
      return Colors.redAccent;
    }();

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircularCountdown(
                countdownTotal: myProvider.minutosPlan == 0 ? 500 : myProvider.minutosPlan, // ?? 0,
                countdownRemaining: myProvider.timeCalls > myProvider.minutosPlan
                    ? myProvider.minutosPlan
                    : myProvider.timeCalls,
                countdownRemainingColor: color,
                diameter: MediaQuery.of(context).size.width * 0.60,
                isClockwise: false,
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        minutosLibres,
                        /* myProvider.timeCalls > myProvider.minutosPlan
                            ? '∞'
                            : '${myProvider.minutosPlan - myProvider.timeCalls}', */
                        style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                      ),
                      Text(lang.minLibres),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Chip(
              labelPadding: EdgeInsets.all(10.0),
              avatar: CircleAvatar(
                backgroundColor: color,
                //radius: double.infinity,
                child: Text(
                  '${myProvider.totalCalls}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              label: Text(lang.callOut),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: LinearProgressIndicator(
                    //backgroundColor: Colors.blueGrey[400], //cyanAccent,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 50.0,
                    value:
                        myProvider.timeCalls > myProvider.minutosPlan ? 1.0 : myProvider.progress,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${myProvider.timeCalls} min'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      myProvider.minutosPlan != 0
                          ? '${((myProvider.timeCalls * 100) / myProvider.minutosPlan).toStringAsFixed(0)} %'
                          : '',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        myProvider.minutosPlan != 0 ? '${myProvider.minutosPlan} min' : '∞',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
