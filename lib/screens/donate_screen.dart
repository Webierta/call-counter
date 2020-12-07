import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import '../localization/language/languages.dart';

class Donate extends StatelessWidget {
  static const String id = 'donate';

  @override
  Widget build(BuildContext context) {
    Languages lang = Languages.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.donar),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text('Calling Plan Control', style: Theme.of(context).textTheme.headline5),
                    Icon(
                      Icons.favorite_border,
                      size: 60.0,
                      color: Colors.cyan[200],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(lang.textDonate, style: Theme.of(context).textTheme.subtitle1),
              Bitcoin(),
            ],
          ),
        ),
      ),
    );
  }
}

class Bitcoin extends StatelessWidget {
  static const String bitcoinAdress = '15ZpNzqbYFx9P7wg4U438JMwZr2q3W6fkS';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: bitcoinAdress)).then(
                  (value) => Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Bitcoin Address copied to Clipboard')),
                  ),
                );
              },
              child: Text(bitcoinAdress),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Image.asset('assets/images/BC_qr.png'),
          ),
        ],
      ),
    );
  }
}
