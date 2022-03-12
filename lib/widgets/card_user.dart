import 'package:bodytech_test_app/models/user_model.dart';
import 'package:bodytech_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  final UserModel user;
  const CardUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context, builder: (context) => DetailsUser(user: user));
        },
        child: Container(
          height: 70,
          color: user.id % 2 == 0
              ? Color.fromARGB(26, 184, 183, 182)
              : Colors.white30,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Text(
            user.title.toUpperCase(),
            maxLines: 2,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
