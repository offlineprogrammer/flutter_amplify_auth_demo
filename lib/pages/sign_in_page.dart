import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  // final SignInManager manager;
  // final bool isLoading;

  // const SignInPage({Key? key, required this.manager, required this.isLoading})
  //     : super(key: key);

  // static Widget create(BuildContext context) {
  //   final auth = Provider.of<AuthBase>(context, listen: false);
  //   return ChangeNotifierProvider<ValueNotifier<bool>>(
  //     create: (_) => ValueNotifier<bool>(false),
  //     child: Consumer<ValueNotifier<bool>>(
  //       builder: (_, isLoading, __) => Provider<SignInManager>(
  //         create: (_) => SignInManager(auth: auth, isLoading: isLoading),
  //         child: Consumer<SignInManager>(
  //           builder: (_, manager, __) => SignInPage(
  //             manager: manager,
  //             isLoading: isLoading.value,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // void _showSignInError(BuildContext context, Exception exception) {
  //   showExceptionAlertDialog(context,
  //       title: 'Sign in failed', exception: exception);
  // }

  // Future<void> _signInAnonymously(BuildContext context) async {
  //   try {
  //     final user = await manager.signInAnonymously();
  //   } on Exception catch (e) {
  //     _showSignInError(context, e);
  //     print(e.toString());
  //   } finally {}
  // }

  // Future<void> _signInWithGoogle(BuildContext context) async {
  //   try {
  //     final user = await manager.signInWithGoogle();
  //   } on Exception catch (e) {
  //     _showSignInError(context, e);
  //     print(e.toString());
  //   } finally {}
  // }

  // Future<void> _signInWithFacebook(BuildContext context) async {
  //   try {
  //     final user = await manager.signInWithFacebook();
  //   } on Exception catch (e) {
  //     _showSignInError(context, e);
  //     print(e.toString());
  //   } finally {}
  // }

  // void _signInWithEmail(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //         builder: (context) => EmailSignInPage(), fullscreenDialog: true),
  //   );
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
              // _showButtonPressDialog(context, 'Email');
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
              //_showButtonPressDialog(context, 'Google');
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            Buttons.FacebookNew,
            padding: const EdgeInsets.symmetric(vertical: 15),
            onPressed: () {
              //_showButtonPressDialog(context, 'Google');
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
