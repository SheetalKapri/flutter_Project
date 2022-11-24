import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ui/splash_screen.dart';
//import 'home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(),
    );
  }
}



//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final CollectionReference _admin = FirebaseFirestore.instance.collection('admin');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: _admin.snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
//             if(streamSnapshot.hasData)
//             {
//               return ListView.builder(
//                 itemCount: streamSnapshot.data!.docs.length, //for total rows
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
//                   return Card(
//                     margin: const EdgeInsets.all(10),
//                     child: ListTile(
//                       title: Text(documentSnapshot['name']),
//                       subtitle: Text(documentSnapshot['price'].toString()),
//                       // trailing: SizedBox(
//                       //   width: 100,
//                       //   child: Row(
//                       //     children: [
//                       //       IconButton(
//                       //           icon: const Icon(Icons.edit),
//                       //           onPressed: () =>
//                       //               _update(documentSnapshot)),
//                       //       IconButton(
//                       //           icon: const Icon(Icons.delete),
//                       //           onPressed: () =>
//                       //               _delete(documentSnapshot.id)),
//                       //     ],
//                       //   ),
//                       // ),
//                       //
//                     ),
//                   );
//                 },
//               );
//             }
//             return const Center(
//             child: CircularProgressIndicator(),
//             );
//     },
//     ),
//     );
//   }
// }
