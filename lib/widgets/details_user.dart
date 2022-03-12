import 'package:bodytech_test_app/models/user_model.dart';
import 'package:flutter/material.dart';

class DetailsUser extends StatelessWidget {
  final UserModel user;
  const DetailsUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            user.title.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'ID: ' + user.id.toString(),
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Text(user.body),
        ],
      ),
    );
  }
}
