import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../localization/language/languages.dart';

class About extends StatelessWidget {
  final String version;
  About({required this.version});

  _launchURL() async {
    const url = 'https://github.com/Webierta/call-counter/issues';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Languages lang = Languages.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.about),
        leading: IconButton(
          icon: const Icon(Icons.close),
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
                    Text('Call Counter', style: Theme.of(context).textTheme.headline5),
                    const Icon(Icons.code, size: 60.0, color: Color(0xFF80DEEA)),
                    Text(
                      '${lang.version} $version (Copyleft 2020)\n'
                      'Jesús Cuerda (Webierta)\n'
                      'All Wrongs Reserved.\n'
                      '${lang.licencia} GPLv3.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Text(lang.source, style: Theme.of(context).textTheme.headline6),
              Text(lang.textAbout),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL(),
                  icon: const Icon(Icons.bug_report),
                  label: const Text('Bug report'),
                ),
              ),
              Text(lang.privacidad, style: Theme.of(context).textTheme.headline6),
              Text(lang.textPrivacidad),
              const SizedBox(height: 10.0),
              Text(lang.licencia, style: Theme.of(context).textTheme.headline6),
              Text(lang.textLicencia),
            ],
          ),
        ),
      ),
    );
  }
}
