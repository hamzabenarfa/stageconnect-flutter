import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Function()? onPress;
  final Color bgColor;
  final Color textColor;

  const LoginBtn({
    Key? key,
    required this.text,
    required this.onTap,
     this.onPress,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
