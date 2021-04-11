import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_demo/models/app_user.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  // Future<void> _signInWithGoogle(BuildContext context) async {
  //   try {
  //     final user = await manager.signInWithGoogle();
  //   } on Exception catch (e) {
  //     _showSignInError(context, e);
  //     print(e.toString());
  //   } finally {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 10,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: _buildHeader(),
            height: 50.0,
          ),
          SizedBox(
            height: 48.0,
          ),
          SignInButtonBuilder(
            text: 'Sign in with email',
            icon: Icons.email,
            height: 60,
            onPressed: () {
              context.read<AppUser>().signIn(AuthProvider.amazon);
            },
            backgroundColor: Colors.blueGrey[700],
            width: 220.0,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            Buttons.Google,
            padding: const EdgeInsets.symmetric(vertical: 8),
            onPressed: () {
              context.read<AppUser>().signIn(AuthProvider.google);
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            Buttons.FacebookNew,
            padding: const EdgeInsets.symmetric(vertical: 15),
            onPressed: () {
              context.read<AppUser>().signIn(AuthProvider.facebook);
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Or',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButtonBuilder(
            text: 'Go anonymous',
            height: 60,
            onPressed: () {
              // _showButtonPressDialog(context, 'Email');
            },
            backgroundColor: Colors.lime[300],
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    // if (isLoading) {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    return Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
