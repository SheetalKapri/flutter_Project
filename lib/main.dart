import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //second method below
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp(
    name: 'SampleProject',
    options: FirebaseOptions(
      apiKey: "AIzaSyDwfm9biSmW54dGU4eZVWj6Kvknx639R5M",
      appId: "1:230653104100:android:eb61f33aa65b767757c1f1",
      messagingSenderId: "230653104100",
      projectId: "sampleproject-9722a",
    ),
  );
  //await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print("Error");
          }
          if(snapshot.connectionState == ConnectionState.done){
            return SplashScreen();
          }
          return CircularProgressIndicator();

        }
      ),
    );
  }
}


