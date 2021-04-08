// abstract class AuthServiceBase {
//   User? get currentUser;
//   Future<User?> signInAnonymously();
//   Future<void> signOut();
//   Stream<User?> authStateChanges();
//   Future<User?> signInWithGoogle();
//   Future<User?> signInWithFacebook();
//   Future<User?> registerWithEmailAndPassword(String email, String password);
//   Future<User?> signInWithEmailAndPassword(String email, String password);
// }

// class AuthService implements AuthServiceBase {
//   final _firebaseAuth = FirebaseAuth.instance;

//   @override
//   Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

//   @override
//   User? get currentUser => _firebaseAuth.currentUser;

//   @override
//   Future<User?> signInAnonymously() async {
//     try {
//       final userCredential = await _firebaseAuth.signInAnonymously();
//       return userCredential.user;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Future<User?> registerWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       return userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//       throw e;
//     } catch (e) {
//       print(e);
//       throw e;
//     }
//   }

//   @override
//   Future<User?> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);
//       return userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//       throw e;
//     }
//   }

//   @override
//   Future<User?> signInWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance
//           .login(); // by the fault we request the email and the public profile
//       if (result.status == LoginStatus.success) {
//         // you are logged
//         final AccessToken accessToken = result.accessToken!;
//         final OAuthCredential facebookAuthCredential =
//             FacebookAuthProvider.credential(accessToken.token);
//         final userCredential =
//             await _firebaseAuth.signInWithCredential(facebookAuthCredential);
//         return userCredential.user;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Future<User?> signInWithGoogle() async {
//     try {
//       final googleSignIn = GoogleSignIn();
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser != null) {
//         final googleAuth = await googleUser.authentication;
//         if (googleAuth.idToken != null) {
//           final userCredential = await _firebaseAuth
//               .signInWithCredential(GoogleAuthProvider.credential(
//             accessToken: googleAuth.accessToken,
//             idToken: googleAuth.idToken,
//           ));
//           return userCredential.user;
//         } else {
//           throw FirebaseAuthException(
//               code: 'ERROR_MISSING_ID_TOKEN',
//               message: 'Missing Google ID Token');
//         }
//       } else {
//         throw FirebaseAuthException(
//             code: 'ERROR_ABORTED_BY_USER', message: 'Sign In aborted by user');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     try {
//       await _firebaseAuth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
