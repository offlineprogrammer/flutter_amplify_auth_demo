import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_demo/models/app_user.dart';
import 'package:flutter_amplify_auth_demo/pages/home_page.dart';
import 'package:flutter_amplify_auth_demo/pages/sign_in_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<AppUser>().isSignedIn;
    print(appUser);
    return appUser ? HomePage() : SignInPage();
  }
}
