import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:first_app/controller/data_controller.dart';
import 'package:first_app/ui/posts/sample_uploads.dart';

class AllMechanic extends StatefulWidget {
  const AllMechanic({Key? key}) : super(key: key);

  @override
  State<AllMechanic> createState() => _AllMechanicState();
}

class _AllMechanicState extends State<AllMechanic> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

    List<String> docIds =[];
    //getting all IDs
    Future getDocId() async {
      await _db.collection('mechanics').get().then((snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        docIds.add(document.reference.id);
      },
      ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Mechanic List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SampleUploads())
                  // to transit to next page >PostScreen
                );
              },
              icon: Icon(Icons.add))
        ],
      ),

      //backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: FutureBuilder(
                  future: getDocId(),
                  builder: (context,snapshot) {
                    return ListView.builder(
                      itemCount: docIds.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: GetDetails(documentId: docIds[index],),
                            tileColor: Colors.grey[200],
                          ),
                        );
                      },
                    );
                  }
                )
            )
          ],
        ),
      ),
    );
  }
}