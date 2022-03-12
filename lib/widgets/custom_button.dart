import 'package:bodytech_test_app/providers/forms_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormsProvider>(context);
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 235, 229),
        borderRadius: BorderRadius.circular(50),
      ),
      child: MaterialButton(
        color: const Color.fromARGB(255, 250, 235, 229),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: formProvider.isLoading
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.black, //Color.fromARGB(255, 211, 60, 0),
                ),
              ),
        onPressed: formProvider.isLoading
            ? null
            : () {
                this.onPressed();
              },
      ),
    );
  }
}
