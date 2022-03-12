import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

showSnackBar({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(text),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
