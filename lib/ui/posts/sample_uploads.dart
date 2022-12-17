import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/ui/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/roundButton.dart';
import '../screens/all_mech_screen.dart';

class SampleUploads extends StatefulWidget {
   SampleUploads({Key? key}) : super(key: key);

  @override
  State<SampleUploads> createState() => _SampleUploadsState();
}

class _SampleUploadsState extends State<SampleUploads> {
   TextEditingController sample1 = TextEditingController();
   TextEditingController sample2 = TextEditingController();
   bool loading = false;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void nextStep(){
    setState(() {
      loading = true; // since its loading while in setState
    });
    Map <String,dynamic> data ={
      "field1":sample1.text,
      "field2":sample2.text
    };
    FirebaseFirestore.instance.collection("mechanics").add(data);
    setState(() {
      loading = false; // since its loading while in setState
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),

      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Data to Database'),
        actions: [
          IconButton(
              onPressed: () { },
              icon: Icon(Icons.add))
        ],
      ),

      backgroundColor: Colors.white70,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20.0,
                    children: [
                      Center(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset("img/mechanic.png",width: 64,),
                              SizedBox(height: 10.0),
                              //to upload data to firebase
                              TextFormField(
                                controller: sample1,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText: 'enter data to upload',
                                    prefixIcon: Icon(Icons.alternate_email)
                                ),

                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Enter data 1';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                controller: sample2,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText: 'enter data to upload',
                                    prefixIcon: Icon(Icons.alternate_email)
                                ),

                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Enter data 2';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.0),
                              RoundButton(
                                title: 'Upload Data',
                                onTap:(){
                                  nextStep();
                                } ,
                              ),
                              SizedBox(height: 15.0),
                              RoundButton(
                                title: 'Display all Data',
                                onTap:(){
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context)=> AllMechanic())
                                  );

                                  } ,
                              ),
                            ],
                          ),


                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
    );
  }
}
