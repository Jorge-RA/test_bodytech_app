import 'package:flutter/material.dart';

PreferredSize customAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(40),
    child: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black, //Color.fromARGB(255, 250, 235, 229),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: const Image(
        image: AssetImage('assets/bodytech_logo.png'),
        fit: BoxFit.contain,
      ),
    ),
  );
}
