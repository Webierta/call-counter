import '../models/data_lang.dart';
import '../localization/language/languages.dart';
import '../models/call.dart';
import '../models/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';

class LogScreenCall extends StatelessWidget {
  const LogScreenCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Data>(context);

    return myProvider.logLength > 0 // myProvider.callsLength > 0
        ? ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myProvider.logLength, //myProvider.callsLength,
            itemBuilder: (BuildContext context, int index) {
              //var entry = myProvider.calls[index];
              var entry = myProvider.logCalls[index];
              final DateFormat formatoHora = DateFormat('HH:mm');
              final DateFormat formatoFecha = DateFormat.yMMMd(context.read<DataLang>().lang);
              String fecha =
                  formatoFecha.format(DateTime.fromMillisecondsSinceEpoch(entry.timestamp));
              if (index > 0) {
                //var entro = myProvider.calls[index - 1];
                var entro = myProvider.logCalls[index - 1];
                var fecha1 =
                    formatoFecha.format(DateTime.fromMillisecondsSinceEpoch(entry.timestamp));
                var fecha2 =
                    formatoFecha.format(DateTime.fromMillisecondsSinceEpoch(entro.timestamp));
                if (fecha1 == fecha2) {
                  fecha = '';
                }
              }
              return ColumnaCalls(fecha: fecha, entry: entry, formatoHora: formatoHora);
            },
          )
        : Center(
            child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(Languages.of(context).noCalls),
          ));
  }
}

class ColumnaCalls extends StatelessWidget {
  const ColumnaCalls({required this.fecha, required this.entry, required this.formatoHora});

  final String fecha;
  final LogCall entry;
  final DateFormat formatoHora;

  @override
  Widget build(BuildContext context) {
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
          margin: EdgeInsets.all(1.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: const Color(0xFF455A64), //Colors.blueGrey[700],
          child: ListTile(
            leading: const Icon(Icons.phone_forwarded, size: 30.0),
            title: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text('${entry.number}'),
            ),
            subtitle:
                Text('${formatoHora.format(DateTime.fromMillisecondsSinceEpoch(entry.timestamp))}'),
            trailing: Text(
              entry.duration < 60
                  ? '${entry.duration} ${Languages.of(context).sec}'
                  : '${Duration(seconds: entry.duration).inMinutes} min.',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ],
    );
  }
}
