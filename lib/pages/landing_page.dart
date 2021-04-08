import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_amplify_auth_demo/pages/home_page.dart';
import 'package:flutter_amplify_auth_demo/pages/sign_in_page.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

// Generated in previous step
import '../amplifyconfiguration.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugins([authPlugin]);

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
