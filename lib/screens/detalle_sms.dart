import '../localization/language/languages.dart';

import '../widgets/head_date.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../models/data.dart';
import 'package:flutter/material.dart';

class DetalleSms extends StatelessWidget {
  static const String id = 'detalle_sms';

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(title: Text(Languages.of(context).detalleSms)),
      body: Column(
        children: [
          HeadDate(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: myProvider.logLengthSms > 0
                        ? ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: myProvider.logLengthSms,
                            itemBuilder: (BuildContext context, int index) {
                              var entry = myProvider.logSms[index];
                              final DateFormat formatoHora = DateFormat('HH:mm');
                              final DateFormat formatoFecha = DateFormat.yMMMd(myProvider.lang);
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
                                            padding: const EdgeInsets.only(
                                                top: 20.0, bottom: 4.0, left: 2.0),
                                            child: Text(
                                              '$fecha',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.blueGrey[100],
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                  Card(
                                    margin: EdgeInsets.all(1.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)),
                                    color: Colors.blueGrey[700],
                                    child: ListTile(
                                      leading: Icon(Icons.sms, size: 30.0),
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
                        : Center(child: Text(Languages.of(context).noSms)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
