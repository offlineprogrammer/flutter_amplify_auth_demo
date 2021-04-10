import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import '../amplifyconfiguration.dart';

class AppUser extends ChangeNotifier {
  AmplifyClass amplifyInstance;
  bool isSignUpComplete;
  bool isSignedIn = false;
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
    } catch (e) {
      print(e);
    }
  }
}
