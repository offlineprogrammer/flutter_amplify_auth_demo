
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_amplify_auth_demo/pages/home_page.dart';
import 'package:flutter_amplify_auth_demo/pages/sign_in_page.dart';
import 'package:flutter_amplify_auth_demo/services/auth.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;

          if (user == null) {
            return SignInPage.create(context);
          }
          return HomePage();
        }
        return Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}