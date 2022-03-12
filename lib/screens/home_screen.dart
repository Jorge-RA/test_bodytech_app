import 'package:bodytech_test_app/screens/screens.dart';
import 'package:bodytech_test_app/widgets/back_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset('assets/bodytech_logo.png'),
          ),
          backgroundColor: Color.fromARGB(255, 15, 15, 15),
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: 'Camera', icon: Icon(Icons.camera_alt_outlined)),
              Tab(text: 'List', icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CamaraScreen(),
            ListScreen(),
          ],
        ),
      ),
    );
  }
}
