import 'package:circular_countdown/circular_countdown.dart';

import '../localization/language/languages.dart';
import '../screens/detalle_sms.dart';
import '../models/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabSms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Data>(context);
    Languages lang = Languages.of(context);
    int numberPlanSms = myProvider.numberPlanSms ?? 1000;

    String smsLibres = () {
      if (numberPlanSms == 0) return '∞';
      if (myProvider.smsCount > numberPlanSms) return '0';
      return '${numberPlanSms - myProvider.smsCount}';
    }();

    Color color = () {
      if ((myProvider.smsCount * 100) / numberPlanSms < 50) return Colors.lightGreen;
      if ((myProvider.smsCount * 100) / numberPlanSms < 75) return Colors.orangeAccent;
      if (myProvider.numberPlanSms == 0) return Theme.of(context).backgroundColor;
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
                  countdownTotal: numberPlanSms == 0 ? 1000 : numberPlanSms, // ?? 0,
                  countdownRemaining: myProvider.smsCount > numberPlanSms
                      ? myProvider.numberPlanSms
                      : myProvider.smsCount,
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
                      Text(
                        smsLibres,
                        style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                      ),
                      Text(lang.smsLibres),
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
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[700],
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 50.0,
                    value: myProvider.smsCount > numberPlanSms ? 1.0 : myProvider.progressSms,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${myProvider.smsCount} SMS'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      myProvider.numberPlanSms != 0
                          ? '${((myProvider.smsCount * 100) / numberPlanSms).toStringAsFixed(0)} %'
                          : '',
                      style: TextStyle(fontSize: 24.0),
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
                          myProvider.numberPlanSms != 0 ? '${myProvider.numberPlanSms} SMS' : '∞'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Chip(
              labelPadding: EdgeInsets.all(10.0),
              backgroundColor: Colors.grey[700],
              avatar: CircleAvatar(
                backgroundColor: color,
                child: Text('${myProvider.smsCount}', style: TextStyle(color: Colors.white)),
              ),
              label: Container(
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(myProvider.smsCount == 1 ? lang.smsOutSingle : lang.smsOut),
                ),
              ),
              deleteIcon: Icon(Icons.list_alt),
              onDeleted: () => Navigator.pushNamed(context, DetalleSms.id),
            ),
          ),
        ],
      ),
    );
  }
}
