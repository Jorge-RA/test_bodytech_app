import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String value) onChanged;
  final Color primaryColor =
      Color.fromARGB(255, 250, 235, 229); //Color.fromARGB(255, 211, 60, 0);
  //     color: Color.fromARGB(45, 245, 245, 245),

  final String labelText;
  final IconData icon;
  final bool isPsw;
  CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.isPsw = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(57, 245, 245, 245),
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        obscureText: isPsw,
        decoration: InputDecoration(
          label: Text(labelText),
          labelStyle: TextStyle(color: primaryColor),
          suffixIcon: Icon(icon, color: primaryColor),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: (value) {
          this.onChanged(value);
        },
        validator: (value) {
          if (value == '') return 'Este campo es requerido';
        },
      ),
    );
  }
}
