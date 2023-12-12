import 'package:flutter/material.dart';
import 'package:projetflutterdev/pages/offer/offer_item.dart';

import '../../models/offer/offer_model.dart';
import '../../service/offer_service.dart';

class OfferList extends StatefulWidget {
  const OfferList({Key? key}) : super(key: key);

  @override
  _OfferListState createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
  List<offerModel> offer = [];
  bool isSidebarOpen = false;

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
              return OfferItem(
                offer: offer![index],
                onDelete: (offerModel model) {
                  // Add your delete logic here
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addoffer');
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer Pages'),
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

