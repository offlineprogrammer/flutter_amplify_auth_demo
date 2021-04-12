import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_demo/models/buttons_enum.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSignInButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final double height;
  static const double borderRadius = 4.0;
  final VoidCallback onPressed;
  final Buttons button;

  const SocialSignInButton({
    Key key,
    @required this.color,
    @required this.onPressed,
    this.height: 50,
    @required this.button,
    @required this.text,
    @required this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
        child: buildRow(),
      ),
    );
  }

  Row buildRow() {
    switch (button) {
      case Buttons.Google:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('images/google-logo.png'),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Opacity(opacity: 0.0, child: Image.asset('images/google-logo.png')),
          ],
        );
      case Buttons.Email:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.email,
            ),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Opacity(
              opacity: 0.0,
              child: Icon(
                Icons.email,
              ),
            ),
          ],
        );

      case Buttons.Facebook:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('images/facebook-logo.png'),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Opacity(
                opacity: 0.0, child: Image.asset('images/facebook-logo.png')),
          ],
        );

      case Buttons.Amazon:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('images/amazon-logo.png'),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Opacity(opacity: 0.0, child: Image.asset('images/amazon-logo.png')),
          ],
        );

      case Buttons.Apple:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.apple,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Opacity(
              opacity: 0.0,
              child: Icon(
                FontAwesomeIcons.apple,
              ),
            ),
          ],
        );
    }
  }
}
