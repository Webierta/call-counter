import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import '../models/data.dart';

class HeadDate extends StatelessWidget {
  //final DateFormat formatoFecha = DateFormat('d MMM yyyy');

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Data>(context);
    //Intl.defaultLocale = myProvider.lang;
    final DateFormat formatoFecha = DateFormat.yMMMd(myProvider.lang);
    //final DateFormat formatoFecha = DateFormat.yMMMd(myProvider.dropdownValor);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      color: Colors.blueGrey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today,
            color: Colors.blueGrey[800],
          ),
          SizedBox(width: 20.0),
          Text(
            '${formatoFecha.format(DateTime.fromMillisecondsSinceEpoch(myProvider.fromDate))} - '
            '${formatoFecha.format(DateTime.fromMillisecondsSinceEpoch(myProvider.toDate - 86400000))}',
            style: TextStyle(color: Colors.blueGrey[800]),
          ),
        ],
      ),
    );
  }
}
