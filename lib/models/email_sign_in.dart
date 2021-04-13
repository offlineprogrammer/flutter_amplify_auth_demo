import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_demo/models/app_user.dart';
import 'package:flutter_amplify_auth_demo/models/validators.dart';

enum EmailSignInFormType { signIn, register, confirm }

class EmailSignIn with EmailAndPasswordValidator, ChangeNotifier {
  final AppUser appUser;
  String email;
  String password;
  EmailSignInFormType formType;
  bool isLoading;
  bool submitted;
  String code;

  EmailSignIn({
    @required this.appUser,
    this.email = '',
    this.password = '',
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
    this.code = '',
  });

  String get primaryButtonText {
    switch (formType) {
      case EmailSignInFormType.signIn:
        return 'Sign In';
      case EmailSignInFormType.register:
        return 'Create an account';
      case EmailSignInFormType.confirm:
        return 'Confirm Sign Up';
    }
  }

  String get secondaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  bool get submitEnabled {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  void updateEmail(String email) => updateWith(email: email);

  void updateCode(String code) => updateWith(code: code);

  void updatePassword(String password) => updateWith(password: password);

  void toggleFormType() {
    updateWith(
        submitted: false,
        email: '',
        password: '',
        code: '',
        isLoading: false,
        formType: this.formType == EmailSignInFormType.signIn
            ? EmailSignInFormType.register
            : EmailSignInFormType.signIn);
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);

    try {
      switch (formType) {
        case EmailSignInFormType.signIn:
          final user =
              await appUser.signInWithEmailAndPassword(email, password);
          break;
        case EmailSignInFormType.register:
          final isSignedUp =
              await appUser.registerWithEmailAndPassword(email, password);
          if (isSignedUp) {
            updateWith(
                formType: EmailSignInFormType.confirm,
                isLoading: false,
                submitted: false);
          }
          break;
        case EmailSignInFormType.confirm:
          final user = await appUser.confirmRegisterWithCode(email, code);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
    String code,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.formType = formType ?? this.formType;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    this.code = code ?? this.code;
    notifyListeners();
  }
}
