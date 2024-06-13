import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_projects/widgets/wavecircularindicator.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  GetUserName({super.key,
  required this.documentId});
  final String documentId;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            // Kullanıcı belgesi mevcutsa, kullanıcı adını görüntüle
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['first_name']} ${data['last_name']}, ${data['age']} years old.');
          } else {
              return const Text('No data found');
            }
        }else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Circularindicator();
          } else {
            return Text('Error: ${snapshot.error}');
          }
      },
    );
  }
}
