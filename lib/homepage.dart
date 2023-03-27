import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // onPressed: Scaffold.of(context).openDrawer(),
          onPressed: (){},
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Image.asset('android/assets/images/logo.png',
          height: kToolbarHeight,
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notifications),
            color: Colors.grey.shade500,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
              ),
              child: const Text('E Barangay PH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            const ListTile(
              leading: Icon(Icons.file_open),
              title: Text('Request Barangay Certs'),
            ),
            const ListTile(
              leading: Icon(Icons.report),
              title: Text('Incident Reports'),
            )
          ],
        ),
      ),
    );

  }
}




