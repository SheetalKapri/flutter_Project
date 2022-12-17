import 'package:flutter/material.dart';
import 'package:first_app/ui/posts/sample_uploads.dart';
import 'package:first_app/ui/screens/dashboard.dart';
import 'all_mech_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                decoration:
                BoxDecoration(color: Theme.of(context).primaryColor),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'MOTO MECH',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold,decorationStyle: TextDecorationStyle.double,
                      decorationThickness: 1.5,letterSpacing: 5,fontSize: 18),
                    ),
                    //Icon(Icons.home)

                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard())
                    // to transit to next page >PostScreen
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Mechanics'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllMechanic())
                    // to transit to next page >PostScreen
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Customer'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.plumbing_outlined),
                title: const Text('Jobs'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.verified_rounded),
                title: const Text('Verify Mechanic'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.verified_rounded),
                title: const Text('Verify Assistant'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.monitor_heart_rounded),
                title: const Text('Traffic'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.rate_review),
                title: const Text('Reviews'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.add_business),
                title: const Text('Sample uploads'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SampleUploads())
                    // to transit to next page >PostScreen
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}