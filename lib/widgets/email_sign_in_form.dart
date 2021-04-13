import 'package:flutter/material.dart';

class EmailSignInForm extends StatefulWidget {
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _emailEditingComplete() {
    // if (model.emailValidator.isValid(model.email))
    //   FocusScope.of(context).requestFocus(_passwordFocusNode);
    // else
    //   FocusScope.of(context).requestFocus(_emailFocusNode);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      //await model.submit();
      Navigator.of(context).pop();
    } catch (e) {}

    print(_emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              // enabled: model.isLoading == false,
              labelText: 'Email',
              hintText: 'test@test.com',
              // errorText: model.emailErrorText,
            ),
            controller: _emailController,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            focusNode: _emailFocusNode,
            onEditingComplete: () => _emailEditingComplete(),
            // onChanged: model.updateEmail,
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            decoration: InputDecoration(
              // enabled: model.isLoading == false,
              labelText: 'Password',
              // errorText: model.passwordErrorText,
            ),
            obscureText: true,
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            focusNode: _passwordFocusNode,
            onEditingComplete: _submit,
            //onChanged: model.updatePassword,
          ),
          SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Register'),
          )
        ],
      ),
    );
  }
}
