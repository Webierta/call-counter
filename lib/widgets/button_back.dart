import '../models/data_lang.dart';
import '../utils/constantes.dart';
import '../utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';
import '../localization/language/languages.dart';

class ButtonBack extends StatefulWidget {
  @override
  _ButtonBackState createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  final SharedPrefs _sharedPrefs = SharedPrefs();

  @override
  void initState() {
    _initSharedPrefs();
    super.initState();
  }

  Future<void> _initSharedPrefs() async => await _sharedPrefs.init();

  @override
  Widget build(BuildContext context) {
    Data _myProvider = Provider.of<Data>(context);
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        _myProvider
          ..updateDropDown = context.read<DataLang>().lang //_myProvider.lang
          ..updateSlider = _sharedPrefs.plan ?? 200
          ..updateSliderSms = _sharedPrefs.planSms ?? 1000
          ..ciclo = CicloPlan.mensual
          ..updateDiaField = _sharedPrefs.dia ?? 1 //_myProvider.diaD
          ..setFromDatePicked(DateTime(DateTime.now().year, DateTime.now().month, 1))
          ..setToDatePicked(DateTime.now());

        final SnackBar snackBar = SnackBar(content: Text(Languages.of(context).snackBar));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushNamed(context, idCallScreen);
      },
    );
  }
}
