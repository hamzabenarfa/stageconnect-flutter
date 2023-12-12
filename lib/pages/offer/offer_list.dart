import 'package:flutter/material.dart';
import 'package:projetflutterdev/pages/offer/offer_item.dart';

import '../../models/offer/offer_model.dart';

class OfferList extends StatefulWidget {
  const OfferList({Key? key}) : super(key: key);

  @override
  _OfferListState createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
  List<offerModel> offer = List<offerModel>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    // Call the getProducts() method when the app initializes
    offer.add(
      offerModel(
          id: "65685424fc933273f87ab1f4",
          title: "stage de 2em",
          company: "steg",
          place: "tunis",
          duration: 2,
          paid: false,
          img: ""
      ),
    );
    offer.add(
      offerModel(
          id: "65685424fc933273f87ab1f4",
          title: "stage pfe",
          company: "iset beja",
          place: "beja",
          duration: 4,
          paid: false,
          img: ""
      ),
    );
  }

  Widget offerList(offer) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            ElevatedButton(
              style :ElevatedButton.styleFrom(
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
              itemCount: offer.length,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                  return OfferItem(
                    offer: offer[index],
                    onDelete: (offerModel model) => {},

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