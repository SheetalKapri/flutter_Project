
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/utils/utils.dart';
import 'package:first_app/widgets/roundButton.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final postController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("Post");
  //table "Post" is created in firebase to store values with ref as databaseRef

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox( height: 30,),
            TextFormField(
              maxLines: 3,
              controller: postController,
              decoration: InputDecoration(
                  hintText: "What data to add",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox( height: 30,),
            RoundButton(title: "Add",loading: loading, onTap: (){
              setState(() {
                loading= true;
              });

              //  child can be given user defined id also OR to make it unique use dateTime
              // databaseRef.child('1').set({
              databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                //use below for sub id in realtime firestore
                // databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).child("Comment").set({
                // this is sending data to firestore database from user
                'id' : DateTime.now().millisecondsSinceEpoch.toString(),
                'title' :postController.text.toString()
              }).then((value){
                Utils().toastMessage("Post added");
                setState(() {
                  loading= false;
                });

              }).onError((error, stackTrace){
                Utils().toastMessage(error.toString());
                setState(() {
                  loading= false;
                });
              });

            })

          ],
        ),
      ),
    );
  }
}
