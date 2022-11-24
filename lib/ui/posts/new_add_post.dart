// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }
//
// class _AddPostScreenState extends State<AddPostScreen> {
//   bool loading = false;
//   final postController = TextEditingController();
//   final databaseRef = FirebaseDatabase.instance.ref("Post");
//   //table "Post" is created in firebase to store values with ref as databaseRef
//
//   // added to fetch data from firestore
//   CollectionReference _referenceMechanics = FirebaseFirestore.instance.collection('mechanics');
//   late Stream<QuerySnapshot> _streamMechanics;
//
//   @override
//   Widget build(BuildContext context) {
//     // _referenceMechanics.get();
//     // _referenceMechanics.snapshots();  // returns stream to get dynamic updates from ui
//     _streamMechanics = _referenceMechanics.snapshots();
//
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Adding Post"),
//       ),
//
//       body: StreamBuilder(
//           stream: _streamMechanics,
//           builder: (BuildContext content,AsyncSnapshot snapshot){
//             if(snapshot.hasError){
//               return Center(child: Text(snapshot.error.toString()));
//             }
//
//             if(snapshot.connectionState==ConnectionState.active){
//               QuerySnapshot querySnapshot=snapshot.data;
//             }
//           }
//       ),
//     );
//   }
// }
//
//
//
//
//
//
