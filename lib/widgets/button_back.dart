import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/call_screen.dart';
import '../models/data.dart';
import '../localization/language/languages.dart';

class ButtonBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data _myProvider = Provider.of<Data>(context);
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        _myProvider
          ..updateDropDown = _myProvider.lang
          ..updateSlider = _myProvider.minutosPlan
          ..ciclo = CicloPlan.mensual
          ..updateDiaField = _myProvider.diaD
          ..setFromDatePicked(DateTime(DateTime.now().year, DateTime.now().month, 1))
          ..setToDatePicked(DateTime.now());
        const int sec = 1;
        final SnackBar snackBar = SnackBar(
          content: Text(Languages.of(context).snackBar),
          duration: Duration(seconds: sec),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        Future.delayed(
          Duration(seconds: sec),
          () => Navigator.pushNamed(context, CallScreen.id),
        );
      },
    );
  }
}
