import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/consts/consts.dart';
import 'package:firebase_projects/read_data/get_user_name.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> docId = [];

class _HomePageState extends State<HomePage> {
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => {
              docId.clear(),
              snapshot.docs
                  .forEach((document) => docId.add(document.reference.id))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pastelBlue,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: prefer_interpolation_to_compose_strings

          Expanded(
            child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docId.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: pastelGray,
                          title: GetUserName(documentId: docId[index]),
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
