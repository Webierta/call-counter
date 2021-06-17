import '../models/data_lang.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import '../models/data.dart';

class HeadDate extends StatelessWidget {
  //final DateFormat formatoFecha = DateFormat('d MMM yyyy');
  const HeadDate();

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Data>(context);
    //Intl.defaultLocale = myProvider.lang;
    //final DateFormat formatoFecha = DateFormat.yMMMd(myProvider.lang);
    final DateFormat formatoFecha = DateFormat.yMMMd(context.select((DataLang data) => data.lang));
    //final DateFormat formatoFecha = DateFormat.yMMMd(myProvider.dropdownValor);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      color: const Color(0xFFB0BEC5), // blueGrey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.calendar_today, color: Color(0xFF37474F)), //blueGrey[800],
          const SizedBox(width: 20.0),
          Text(
            '${formatoFecha.format(DateTime.fromMillisecondsSinceEpoch(myProvider.fromDate))} - '
            '${formatoFecha.format(DateTime.fromMillisecondsSinceEpoch(myProvider.toDate - 86400000))}',
            style: const TextStyle(color: Color(0xFF37474F)),
          ),
        ],
      ),
    );
  }
}
