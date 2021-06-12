import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../models/data.dart';

class Fecha extends StatelessWidget {
  final DateTime fecha;
  final String label;
  final Function update;

  Fecha({required this.fecha, required this.label, required this.update});

  @override
  Widget build(BuildContext context) {
    Data _myProvider = Provider.of<Data>(context);
    Color colorCustom = _myProvider.ciclo == CicloPlan.custom ? Colors.white : Colors.grey;

    Future<DateTime> _selectDate(DateTime fecha) async {
      final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendar,
        fieldHintText: _myProvider.lang == 'es' ? 'dd/mm/aaaa' : 'mm/dd/yyyy',
        context: context,
        initialDate: fecha,
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
        locale: Locale(_myProvider.lang),
      );
      if (picked != null && picked != fecha) {
        return picked;
      }
      return fecha;
    }

    return InkWell(
      onTap: () async {
        if (_myProvider.ciclo == CicloPlan.custom) {
          DateTime fechaGet = await _selectDate(fecha);
          update(fechaGet);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          enabled: _myProvider.ciclo == CicloPlan.custom ? true : false,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              DateFormat.yMMMd(_myProvider.lang).format(fecha),
              style: TextStyle(color: colorCustom),
            ),
            Icon(Icons.arrow_drop_down, color: colorCustom),
          ],
        ),
      ),
    );
  }
}
