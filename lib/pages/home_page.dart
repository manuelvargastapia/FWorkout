import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              child: DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 70.0,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Insert fancy content here'),
        ),
      ),
    );
  }
}
