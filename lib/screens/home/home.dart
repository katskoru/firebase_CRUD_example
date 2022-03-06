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
            icon: const Icon(Icons.logout))
      ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return listItem("Brand", index.toString());
              }),
        ),
      ),
    );
  }

  Widget listItem(brand, model) {
    return ListTile(
      title: Text(brand),
      subtitle: Text(model),
      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
    );
  }
}
