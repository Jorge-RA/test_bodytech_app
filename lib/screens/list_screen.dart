import 'package:bodytech_test_app/models/user_model.dart';
import 'package:bodytech_test_app/services/list_service.dart';
import 'package:bodytech_test_app/widgets/card_user.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final listServices = ListServices();
  ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: listServices.getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else {
            return ListCardUsers(listData: snapshot.data);
          }
        },
      ),
    );
  }
}

class ListCardUsers extends StatelessWidget {
  final List<UserModel> listData;
  const ListCardUsers({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        indent: 60,
        endIndent: 60,
        color: Colors.orange,
      ),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return CardUser(user: listData[index]);
      },
    );
  }
}
