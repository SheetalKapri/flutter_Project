import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetDetails extends StatelessWidget {
  //const GetDetails({Key? key}) : super(key: key);
  final String documentId;

  GetDetails({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mechanics');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
        builder: ((context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            //return Text('First Name: ${data['mech_fname']}');
            return Text('${data['mech_fname']}'+' ' +'${data['mech_lname']}' +' -  '+ '${data['mech_address']}');
          }
          return Text('loading ..');
        }),
        );


  }
}

