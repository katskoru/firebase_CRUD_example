import 'package:firebase_example/screens/auth/data/providers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Provider.of<AuthState>(context, listen: false).signOut();
            },
            icon: Icon(Icons.logout))
      ]),
      body: Center(
          child: TextButton(
              onPressed: () {
                Provider.of<AuthState>(context, listen: false).signOut();
              },
              child: const Text("Log Out"))),
    );
  }
}
