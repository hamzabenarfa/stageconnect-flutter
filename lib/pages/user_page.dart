import 'package:flutter/material.dart';
import 'package:projetflutterdev/pages/offer/offer_item.dart';

import '../../models/offer/offer_model.dart';
import '../../service/offer_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<offerModel> offer = [];

  bool isSidebarOpen = false; // Use CamelCase for class names

  @override
  void initState() {
    super.initState();
    // Call the getOffer() method when the app initializes
    fetchOffer();
  }

  // Method to fetch offers from the service
  Future<void> fetchOffer() async {
    try {
      List<offerModel>? offerData = await OfferService.getOffer();

      if (offerData != null) {
        setState(() {
          offer = offerData;
        });
      } else {
        print('Error fetching data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Widget offerList(List<offerModel>? offer) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: offer?.length ?? 0,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer![index].title!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Company: ${offer[index].company}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Place: ${offer[index].place}", // Add the actual place value
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Pages'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: offerList(offer),
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
              const DrawerHeader(
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
                  Navigator.pushReplacementNamed(context, '/');

                },
              ),
            ],
          ),
        ),
      ),
    
    );
  }
}

