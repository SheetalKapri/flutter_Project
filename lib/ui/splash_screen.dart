import 'package:first_app/firebase_services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen= SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MOTO MECH APP',
          style: TextStyle(
              color: Colors.teal, fontWeight: FontWeight.bold,decorationStyle: TextDecorationStyle.double,
              decorationThickness: 2.0,letterSpacing: 3,fontSize: 30,),
        )

        // Text("Moto Mech App",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.cyan,
        //     fontSize: 30),
        // ),

      )
    );
  }
}
