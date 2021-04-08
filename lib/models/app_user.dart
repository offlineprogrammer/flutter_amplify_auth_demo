import 'package:flutter/material.dart';
// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

// Generated in previous step
import '../amplifyconfiguration.dart';

class AppUser extends ChangeNotifier {
  AmplifyClass amplifyInstance;

  bool isSignUpComplete;
  bool isSignedIn;
  String username;

  AppUser() {
    this.amplifyInstance = AmplifyClass();
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
}
