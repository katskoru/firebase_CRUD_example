import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/screens/auth/data/providers/auth_state.dart';
import 'package:firebase_example/screens/home/data/models/cars_model.dart';
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
          child: FutureBuilder(
              future: FirebaseFirestore.instance.collection("cars").get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<Cars> _listOfCars =
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Cars.fromJson(data);
                  }).toList();

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _listOfCars.length,
                      itemBuilder: (context, index) {
                        Cars _car = _listOfCars[index];
                        return listItem(_car.brand, _car.model);
                      });
                }
              }),
        ),
      ),
    );
  }

  Widget listItem(brand, model) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd ||
            direction == DismissDirection.endToStart) print("delete");
      },
      child: ListTile(
        title: Text(brand),
        subtitle: Text(model),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
      ),
    );
  }
}
