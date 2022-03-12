import 'package:flutter/material.dart';

class TextLoginLogout extends StatelessWidget {
  final String text;
  final String routeName;
  const TextLoginLogout({
    Key? key,
    required this.text,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, routeName),
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.white,
        ),
      ),
    );
  }
}
