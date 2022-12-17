import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome Home'),
        actions: [
          IconButton(
              onPressed: () {
                // to be added under screens part

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AdminAccount())
                //   // to transit to next page >PostScreen
                // );
              },
              icon: Icon(Icons.account_box))
        ],
      ),
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            MyMenu(title: "Mechanics", icon: Icons.account_balance, warna: Colors.teal,collName: 'mechanics'),
            MyMenu(title: "Customers", icon: Icons.account_balance, warna: Colors.teal,collName: 'customer'),
            MyMenu(title: "Verified Mechanics", icon: Icons.account_balance, warna: Colors.teal,collName: 'users'),
            MyMenu(title: "Verified Assistant", icon: Icons.account_balance, warna: Colors.teal,collName: 'mechanics'),
            MyMenu(title: "Pending Verification", icon: Icons.account_balance, warna: Colors.teal,collName: 'testing'),

          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({required this.title, required this.icon, required this.warna,required this.collName});

  final String title;
  final IconData icon;
  final MaterialColor warna;
  final String collName;
  int count=0;


  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<String> docIds =[];
  //getting all IDs
  Future getDocId() async {
    await _db.collection(collName).get().then((snapshot) => snapshot.docs.forEach((document) {
      docIds.add(document.reference.id);
      count++;
    },
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    future: getDocId();
    itemCount: docIds.length;
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){ },
        splashColor: Colors.lightGreen,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 60.0,color: warna,),
              Text(title, style: new TextStyle(fontSize: 14.0),),
              Text('Count : '+ count.toString(), style: new TextStyle(fontSize: 14.0),),
            ],
          ),
        ),
      ),
    );
  }
}
