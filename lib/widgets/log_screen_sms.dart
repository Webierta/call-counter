import '../localization/language/languages.dart';
import '../models/data.dart';
import '../models/data_lang.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show DateFormat;

class LogScreenSms extends StatelessWidget {
  const LogScreenSms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Data>(context);

    return myProvider.logLengthSms > 0
        ? ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myProvider.logLengthSms,
            itemBuilder: (BuildContext context, int index) {
              var entry = myProvider.logSms[index];
              final DateFormat formatoHora = DateFormat('HH:mm');
              //final DateFormat formatoFecha = DateFormat.yMMMd(myProvider.lang);
              final DateFormat formatoFecha = DateFormat.yMMMd(context.read<DataLang>().lang);
              String fecha = formatoFecha.format(entry.date);
              if (index > 0) {
                var entro = myProvider.logSms[index - 1];
                var fecha1 = formatoFecha.format(entry.date);
                var fecha2 = formatoFecha.format(entro.date);
                if (fecha1 == fecha2) {
                  fecha = '';
                }
              }
              return Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: fecha != ''
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 4.0, left: 2.0),
                            child: Text(
                              '$fecha',
                              style: const TextStyle(fontSize: 18.0, color: Color(0xFFCFD8DC)),
                            ),
                          )
                        : null,
                  ),
                  Card(
                    margin: const EdgeInsets.all(1.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: const Color(0xFF455A64), // Colors.blueGrey[700],
                    child: ListTile(
                      leading: const Icon(Icons.sms, size: 30.0),
                      title: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text('${entry.number}'),
                      ),
                      subtitle: Text('${formatoHora.format(entry.date)}'),
                    ),
                  ),
                ],
              );
            },
          )
        : Center(
            child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(Languages.of(context).noSms),
          ));
  }
}
