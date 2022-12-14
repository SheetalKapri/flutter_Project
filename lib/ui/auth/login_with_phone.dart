import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/ui/auth/verify_code.dart';
import 'package:first_app/utils/utils.dart';
import 'package:first_app/widgets/roundButton.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneNo extends StatefulWidget {
  const LoginWithPhoneNo({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNo> createState() => _LoginWithPhoneNoState();
}

class _LoginWithPhoneNoState extends State<LoginWithPhoneNo> {


  bool loading=false;
  final phoneNumController= TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80,),

            TextFormField(
              //to type the phone number
              controller: phoneNumController, // takes the ip
              keyboardType:  TextInputType.number,
              decoration: InputDecoration(
                hintText: '+1 911 2345 882'
              ),
            ),
            SizedBox(height: 80,),
            RoundButton(title: 'Login', loading: loading, onTap: (){
              setState(() {
                loading = true;
              });

              auth.verifyPhoneNumber(
                  phoneNumber: phoneNumController.text,
                  verificationCompleted: (_){
                    setState(() {
                      loading = false;
                    });
                  },
                  verificationFailed: (e){
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  },
                  codeSent: (String verificationID, int? token){//both received from firebase
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => VerifyCodeScreen(verificationID: verificationID,))
                    // to transit to next page

                    );
                    setState(() {  loading = false;  });
                  },
                  codeAutoRetrievalTimeout: (e){
                    Utils().toastMessage(e.toString());
                    setState(() {  loading = false;  });
                  }
              );
            }
            )

          ],
        ),
      ),
    );
  }
}
