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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shadowColor: Colors.red,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/addoffer');
            },
            child: const Text('Add Offer'),
          ),
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
    );
  }
}
