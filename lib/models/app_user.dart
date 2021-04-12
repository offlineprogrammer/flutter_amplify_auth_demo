import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import '../amplifyconfiguration.dart';

class AppUser extends ChangeNotifier {
  bool isSignUpComplete;
  bool isSignedIn = false;
  String username;

  AppUser() {
    print('Amplify ' + Amplify.isConfigured.toString());
    if (!Amplify.isConfigured) configureAmplify();
    // _fetchSession();
  }

  void configureAmplify() async {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugins([authPlugin]);

    try {
      print('Amplify configureAmplify ' + Amplify.isConfigured.toString());
      await Amplify.configure(amplifyconfig);
      print('Amplify configureAmplify ' + Amplify.isConfigured.toString());
    } catch (e) {
      print('Erroorrr ' + e.toString());
    } finally {
      // _fetchSession();
    }
  }

  void _fetchSession() async {
    try {
      signOut();
      var res = await Amplify.Auth.getCurrentUser();
      print(res.username);
      isSignedIn = true;
      notifyListeners();
    } catch (e) {
      //  print(e.message);
    }
  }

  void signIn(AuthProvider authProvider) async {
    try {
      var res = await Amplify.Auth.signInWithWebUI(provider: authProvider);
      isSignedIn = true;
      notifyListeners();
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  void signOut() async {
    try {
      await Amplify.Auth.signOut();
      print('signed out');
      isSignedIn = false;
      notifyListeners();
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
