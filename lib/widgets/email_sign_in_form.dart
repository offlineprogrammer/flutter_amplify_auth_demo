import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_demo/models/app_user.dart';
import 'package:flutter_amplify_auth_demo/models/email_sign_in.dart';
import 'package:flutter_amplify_auth_demo/widgets/show_error_dialog.dart';
import 'package:provider/provider.dart';

class EmailSignInForm extends StatefulWidget {
  final EmailSignIn model;

  const EmailSignInForm({Key key, this.model}) : super(key: key);

  static Widget create(BuildContext context) {
    final appUser = Provider.of<AppUser>(context, listen: false);
    return ChangeNotifierProvider<EmailSignIn>(
      create: (_) => EmailSignIn(appUser: appUser),
      child: Consumer<EmailSignIn>(
        builder: (_, model, __) => EmailSignInForm(model: model),
      ),
    );
  }

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  EmailSignIn get model => widget.model;

  void _emailEditingComplete() {
    if (model.emailValidator.isValid(model.email))
      FocusScope.of(context).requestFocus(_passwordFocusNode);
    else
      FocusScope.of(context).requestFocus(_emailFocusNode);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _codeController.dispose();
    _codeFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await model.submit();
      print('Mode is ' + model.formType.toString());
      // if (model.formType != EmailSignInFormType.confirm) {
      //   Navigator.of(context).pop();
      // }
      if (model.submitted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showErrorDialog(
        context,
        title: 'Error',
        content: e.message,
        defaultActionText: 'Ok',
      );
    }
  }

  void _toggleFormType() {
    model.toggleFormType();
    _emailController.clear();
    _passwordController.clear();
    _codeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: model.formType == EmailSignInFormType.confirm
            ? _buildConfirmchildren()
            : _buildFormchildren(),
      ),
    );
  }

  List<Widget> _buildFormchildren() {
    return [
      TextField(
        decoration: InputDecoration(
          enabled: model.isLoading == false,
          labelText: 'Email',
          hintText: 'test@test.com',
          errorText: model.emailErrorText,
        ),
        controller: _emailController,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: _emailFocusNode,
        onEditingComplete: () => _emailEditingComplete(),
        onChanged: model.updateEmail,
      ),
      SizedBox(
        height: 8.0,
      ),
      TextField(
        decoration: InputDecoration(
          enabled: model.isLoading == false,
          labelText: 'Password',
          errorText: model.passwordErrorText,
        ),
        obscureText: true,
        controller: _passwordController,
        textInputAction: TextInputAction.done,
        focusNode: _passwordFocusNode,
        onEditingComplete: _submit,
        onChanged: model.updatePassword,
      ),
      SizedBox(
        height: 8.0,
      ),
      ElevatedButton(
        onPressed: model.submitEnabled ? _submit : null,
        child: Text(
          model.primaryButtonText,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      TextButton(
        onPressed: !model.isLoading ? _toggleFormType : null,
        child: Text(model.secondaryButtonText),
      )
    ];
  }

  List<Widget> _buildConfirmchildren() {
    return [
      TextField(
        decoration: InputDecoration(
          enabled: model.isLoading == false,
          labelText: 'Confirmation Code',
          hintText: 'The code we sent you',
          errorText: model.emailErrorText,
        ),
        controller: _codeController,
        autocorrect: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        focusNode: _passwordFocusNode,
        onEditingComplete: _submit,
        onChanged: model.updateCode,
      ),
      SizedBox(
        height: 8.0,
      ),
      ElevatedButton(
        onPressed: model.submitEnabled ? _submit : null,
        child: Text(
          model.primaryButtonText,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
    ];
  }
}
