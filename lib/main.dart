import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_demo/models/email_sign_in.dart';
import 'package:flutter_amplify_auth_demo/pages/landing_page.dart';
import 'package:provider/provider.dart';

import 'models/app_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AppUser(),
        ),
      ],
      child: MaterialApp(
        title: 'Amplify Auth Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: LandingPage(),
      ),
    );
  }
}
