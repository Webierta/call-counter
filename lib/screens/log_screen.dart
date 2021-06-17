import '../localization/language/languages.dart';
import '../utils/constantes.dart';
import '../widgets/head_date.dart';
import '../widgets/log_screen_call.dart';
import '../widgets/log_screen_sms.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatelessWidget {
  final TipoPlan tipo;
  const LogScreen({required this.tipo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tipo == TipoPlan.call
            ? Languages.of(context).detalleCall
            : Languages.of(context).detalleSms),
      ),
      body: Column(
        children: [
          const HeadDate(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: tipo == TipoPlan.call ? LogScreenCall() : LogScreenSms(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
