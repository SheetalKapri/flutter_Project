
import 'package:flutter/material.dart';

import '../../component/mechanic.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu, color: Colors.white, size: 30.0,),
                      Image.asset("img/user.png",color: Colors.white ,width: 30.0)
                    ],
                  )
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20.0,
                    children: [
                      SizedBox(
                        width: 160.0, height: 160.0,
                        child: Card(
                          color: Colors.amber,
                          elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset("img/mechanic.png",width: 64,),
                                  SizedBox(height: 10.0),
                                  Text("Mechanic", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                  ),),
                                  SizedBox(height: 10.0),

                                ],
                              ),


                            ),
                          ),

                        ),
                      ),

                      SizedBox(
                        width: 160.0, height: 160.0,
                        child: Card(
                          color: Colors.amber,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset("img/client.png",width: 64,),
                                  SizedBox(height: 10.0),
                                  Text("Customer", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                  ),),
                                  SizedBox(height: 10.0),
                                  Text("2 Items",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),)
                                ],
                              ),


                            ),
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
