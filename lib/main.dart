import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_demo/pages/home_page.dart';
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
        title: 'Timer Tracker',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: HomePage(),
      ),
    );
  }
}
