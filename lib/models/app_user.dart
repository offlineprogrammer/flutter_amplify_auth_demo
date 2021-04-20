import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import '../amplifyconfiguration.dart';

class AppUser extends ChangeNotifier {
  bool isSignedIn = false;
  String username;

  AppUser() {
    if (!Amplify.isConfigured) configureAmplify();
  }

  void configureAmplify() async {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugins([authPlugin]);

    try {
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print('Error ' + e.toString());
    } finally {
      // For development let's make sure we are signed out
      signOut();
    }
  }

  void signIn(AuthProvider authProvider) async {
    try {
      await Amplify.Auth.signInWithWebUI(provider: authProvider);
      isSignedIn = true;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  void signOut() async {
    try {
      await Amplify.Auth.signOut();
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
      await Amplify.Auth.signUp(
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
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  confirmRegisterWithCode(String email, String code) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: code);

      isSignedIn = res.isSignUpComplete;
      notifyListeners();
      return true;
    } on AuthException catch (e) {
      throw e;
    }
  }
}
