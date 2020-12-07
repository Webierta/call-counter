import 'package:flutter/material.dart';
import '../localization/language/languages.dart';

class Info extends StatelessWidget {
  static const String id = 'info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            //Navigator.pop(context);
            Navigator.of(context).pop();
          },
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
                    Text('Call Counter', style: Theme.of(context).textTheme.headline5),
                    Icon(
                      Icons.info,
                      size: 60.0,
                      color: Colors.cyan[200],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                Languages.of(context).textInfo,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
