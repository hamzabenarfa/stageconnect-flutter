import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  bool isSidebarOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Page'),
      ),
      body: const Center(
        child: Text('Welcome to Offer Page!'),
      ),
      endDrawer: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.translationValues(
          isSidebarOpen ? -MediaQuery.of(context).size.width * 0.6 : 0,
          0,
          0,
        ),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Offer Page',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  // Handle Profile option
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle Settings option
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  // Handle Logout option
                  Navigator.pop(context); // Close the drawer
                  _logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Perform logout logic
    // ...

    // Navigate to the home route ("/")
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  }
}
