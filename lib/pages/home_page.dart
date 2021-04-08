import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
//      final auth = Provider.of<AuthBase>(context, listen: false);
//      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    try {
      // final didRequestSignOut = await showAlertDialog(context,
      //     title: 'Logout',
      //     content: 'Are you sure you want to logout',
      //     defaultActionText: 'Logout',
      //     cancelActionText: 'Cancel');

      // if (didRequestSignOut == true) {
      //   _signOut(context);
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
            onPressed: () => _confirmSignOut(context),
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
