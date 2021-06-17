import '../models/data_lang.dart';
import '../utils/constantes.dart';
import '../utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../localization/language/languages.dart';
import '../models/language_data.dart';
import '../models/data.dart';
import '../widgets/button_back.dart';
import '../widgets/fecha.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
    TextEditingController _controller =
        TextEditingController(text: _myProvider.diaField.toString());
    Languages lang = Languages.of(context);
    Color colorCustom = _myProvider.ciclo == CicloPlan.custom ? Colors.white : Colors.grey;
    Color colorMensual = _myProvider.ciclo == CicloPlan.custom ? Colors.grey : Colors.white;

    _showDialog(String titulo, String contenido) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(contenido),
            actions: <Widget>[
              TextButton(
                child: Text(lang.close),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        },
      );
    }

    void getData() async {
      bool error = false;
      if (_myProvider.ciclo == CicloPlan.custom) {
        if (_myProvider.fromDatePicked.difference(_myProvider.toDatePicked).inDays > 0) {
          error = true;
          _showDialog('Error', lang.errorRange);
        } else {
          _myProvider.setDates(_myProvider.fromDatePicked.millisecondsSinceEpoch,
              _myProvider.toDatePicked.millisecondsSinceEpoch + 86400000);
        }
      } else {
        if (int.parse(_controller.text) < 1 || int.parse(_controller.text) > 31) {
          error = true;
          _showDialog('Error', lang.errorDay);
        } else {
          _myProvider.updateDiaField = int.parse(_controller.text);
          _myProvider.setPrefDia = _myProvider.diaField;
        }
      }
      if (!error) {
        //_myProvider.setPrefPlan = _myProvider.sliderValor;
        _sharedPrefs.plan = _myProvider.sliderValor;
        //_myProvider.setPrefPlanSms = _myProvider.sliderValorSms;
        _sharedPrefs.planSms = _myProvider.sliderValorSms;
        //_myProvider.setPrefLang = _myProvider.dropdownValor;
        context.read<DataLang>().setPrefLang = _myProvider.dropdownValor;
        //context.select((DataLang lang) => lang.setPrefLang = _myProvider.dropdownValor);
        _myProvider.updateCallSms();
        Navigator.of(context).pushNamed(idCallScreen);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.settings),
        leading: _sharedPrefs.plan != null ? ButtonBack() : null,
        actions: [
          IconButton(
            onPressed: getData,
            icon: const Icon(Icons.save, color: Color(0xFF80DEEA), size: 40),
            padding: const EdgeInsets.only(right: 10),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lang.labelSelectLanguage, style: TextStyle(color: Colors.grey)),
              Container(
                padding: const EdgeInsets.only(right: 20.0),
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: DropdownButton<String>(
                    value: _myProvider.dropdownValor,
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(height: 2, color: Theme.of(context).accentColor),
                    isExpanded: true,
                    onChanged: (value) {
                      _myProvider.updateDropDown = value!;
                      //_myProvider.setPrefLang = _myProvider.dropdownValor;
                      context.read<DataLang>().setPrefLang = _myProvider.dropdownValor;
                    },
                    items: LanguageData.langs
                        .map((lang) => DropdownMenuItem(
                              value: lang.languageCode,
                              child: FittedBox(child: Text('${lang.flag}  ${lang.name}')),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const Divider(color: Colors.grey),
              FittedBox(child: Text(lang.labelSliderPlan, style: TextStyle(color: Colors.grey))),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40.0,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        _myProvider.sliderValor == 0 ? '∞' : '${_myProvider.sliderValor}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: _myProvider.sliderValor.toDouble(),
                      min: 0,
                      max: 500,
                      divisions: 100,
                      activeColor: Theme.of(context).accentColor,
                      label: _myProvider.sliderValor == 0
                          ? lang.unlimited
                          : _myProvider.sliderValor.toString() + ' min',
                      onChanged: (double value) => _myProvider.updateSlider = value.toInt(),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              FittedBox(child: Text(lang.labelSliderPlanSms, style: TextStyle(color: Colors.grey))),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40.0,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        _myProvider.sliderValorSms == 0 ? '∞' : '${_myProvider.sliderValorSms}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: _myProvider.sliderValorSms.toDouble(),
                      min: 0,
                      max: 2000,
                      divisions: 200,
                      activeColor: Theme.of(context).accentColor,
                      label: _myProvider.sliderValorSms == 0
                          ? lang.unlimited
                          : _myProvider.sliderValorSms.toString(),
                      onChanged: (double value) => _myProvider.updateSliderSms = value.toInt(),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              FittedBox(child: Text(lang.plan, style: TextStyle(color: Colors.grey))),
              RadioListTile<CicloPlan>(
                title: Text(lang.planMensual, style: TextStyle(color: colorMensual)),
                value: CicloPlan.mensual,
                groupValue: _myProvider.ciclo,
                activeColor: Theme.of(context).accentColor,
                onChanged: (value) {
                  _myProvider
                    ..ciclo = value!
                    ..setFromDatePicked(DateTime(DateTime.now().year, DateTime.now().month, 1))
                    ..setToDatePicked(DateTime.now());
                },
                subtitle: TextFormField(
                  decoration: InputDecoration(
                    labelText: lang.startDay,
                    enabled: _myProvider.ciclo == CicloPlan.custom ? false : true,
                    suffixIcon: Icon(Icons.insert_invitation),
                    contentPadding: EdgeInsets.only(top: 8.0),
                  ),
                  controller: _controller,
                  onChanged: (value) => _myProvider.updateDiaField = int.tryParse(value) ?? 1,
                  style: TextStyle(color: colorMensual),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              RadioListTile<CicloPlan>(
                title: Text(lang.customDate, style: TextStyle(color: colorCustom)),
                value: CicloPlan.custom,
                groupValue: _myProvider.ciclo,
                activeColor: Theme.of(context).accentColor,
                onChanged: (value) {
                  _myProvider
                    ..ciclo = value!
                    ..updateDiaField = _sharedPrefs.dia ?? 1; //_myProvider.diaD;
                },
                subtitle: Column(
                  children: [
                    Fecha(
                      fecha: _myProvider.fromDatePicked,
                      label: lang.fromDate,
                      update: _myProvider.setFromDatePicked,
                    ),
                    Fecha(
                      fecha: _myProvider.toDatePicked,
                      label: lang.toDate,
                      update: _myProvider.setToDatePicked,
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
