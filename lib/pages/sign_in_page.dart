// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SignInPage extends StatelessWidget {
//   final SignInManager manager;
//   final bool isLoading;

//   const SignInPage({Key? key, required this.manager, required this.isLoading})
//       : super(key: key);

//   static Widget create(BuildContext context) {
//     final auth = Provider.of<AuthBase>(context, listen: false);
//     return ChangeNotifierProvider<ValueNotifier<bool>>(
//       create: (_) => ValueNotifier<bool>(false),
//       child: Consumer<ValueNotifier<bool>>(
//         builder: (_, isLoading, __) => Provider<SignInManager>(
//           create: (_) => SignInManager(auth: auth, isLoading: isLoading),
//           child: Consumer<SignInManager>(
//             builder: (_, manager, __) => SignInPage(
//               manager: manager,
//               isLoading: isLoading.value,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showSignInError(BuildContext context, Exception exception) {
//     showExceptionAlertDialog(context,
//         title: 'Sign in failed', exception: exception);
//   }

//   Future<void> _signInAnonymously(BuildContext context) async {
//     try {
//       final user = await manager.signInAnonymously();
//     } on Exception catch (e) {
//       _showSignInError(context, e);
//       print(e.toString());
//     } finally {}
//   }

//   Future<void> _signInWithGoogle(BuildContext context) async {
//     try {
//       final user = await manager.signInWithGoogle();
//     } on Exception catch (e) {
//       _showSignInError(context, e);
//       print(e.toString());
//     } finally {}
//   }

//   Future<void> _signInWithFacebook(BuildContext context) async {
//     try {
//       final user = await manager.signInWithFacebook();
//     } on Exception catch (e) {
//       _showSignInError(context, e);
//       print(e.toString());
//     } finally {}
//   }

//   void _signInWithEmail(BuildContext context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//           builder: (context) => EmailSignInPage(), fullscreenDialog: true),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Time Tracker'),
//         elevation: 10,
//       ),
//       body: _buildContent(context),
//       backgroundColor: Colors.grey[200],
//     );
//   }

//   Widget _buildContent(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           SizedBox(
//             child: _buildHeader(),
//             height: 50.0,
//           ),
//           SizedBox(
//             height: 48.0,
//           ),
//           SocialSignInButton(
//             assetName: 'images/google-logo.png',
//             text: 'Sign in with Google',
//             textColor: Colors.black87,
//             color: Colors.white,
//             onPressed: isLoading ? null : () => _signInWithGoogle(context),
//           ),
//           SizedBox(
//             height: 8.0,
//           ),
//           SocialSignInButton(
//             assetName: 'images/facebook-logo.png',
//             text: 'Sign in with Facebook',
//             textColor: Colors.white,
//             color: Color(0xFF334D92),
//             onPressed: isLoading ? null : () => _signInWithFacebook(context),
//           ),
//           SizedBox(
//             height: 8.0,
//           ),
//           SignInButton(
//             text: 'Sign in with email',
//             textColor: Colors.white,
//             color: Colors.teal.shade700,
//             onPressed: isLoading ? null : () => _signInWithEmail(context),
//           ),
//           SizedBox(
//             height: 8.0,
//           ),
//           Text(
//             'Or',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.black87,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(
//             height: 8.0,
//           ),
//           SignInButton(
//             text: 'Go anonymous',
//             textColor: Colors.black,
//             color: Colors.lime.shade300,
//             onPressed: isLoading ? null : () => _signInAnonymously(context),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     if (isLoading) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     return Text(
//       'Sign In',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: 32,
//         fontWeight: FontWeight.w600,
//       ),
//     );
//   }
// }
