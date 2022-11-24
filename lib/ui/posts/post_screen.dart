import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/ui/login_screen.dart';
import 'package:first_app/ui/posts/add_post.dart';
import 'package:first_app/utils/utils.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_web/material.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        actions: [
          // to make back to login screen
          IconButton(onPressed: ( ){
            auth.signOut().then((value){
              //transit to Login screen on pressing icon
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon: Icon(Icons.logout_outlined),
          ),
          SizedBox(width: 10,)
        ],
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPostScreen()));
          },
          child: Icon(Icons.add),
          ),
    );
  }
}
