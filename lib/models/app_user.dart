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
      signOut();
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
    } catch (e) {
      throw e;
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

  Future<bool> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      Map<String, String> userAttributes = {
        'email': email,
        'preferred_username': email,
        // additional attributes as needed
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      return true;
    } on AuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: email.trim(),
        password: password.trim(),
      );

      isSignedIn = res.isSignedIn;
    } catch (e) {
      print('Error ' + e.toString());
      throw e;
    }
  }

  confirmRegisterWithCode(String email, String code) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: code);
      print(res.isSignUpComplete);
      isSignedIn = res.isSignUpComplete;
      notifyListeners();
      return true;
    } on AuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
