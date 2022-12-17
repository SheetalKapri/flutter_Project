import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/ui/login_screen.dart';
import 'package:first_app/ui/posts/sample_uploads.dart';
import 'package:first_app/ui/signup_screen.dart';
import 'package:flutter/material.dart';



class SplashServices{

  void isLogin(BuildContext context){
    // part-9 check if user is already login/log out
    final auth=FirebaseAuth.instance;
    final user = auth.currentUser;
    // to check if this user has already loged in or not
    if(user!= null){
      Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> SignupScreen()))
          // if already loged in then transit to PostScreen page
      );
    }else{
      Timer(Duration(seconds: 3),
              ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreen()))
          // else send to login screen
      );
    }
  }
}