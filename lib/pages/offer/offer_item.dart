import 'package:flutter/material.dart';

import '../../models/offer/offer_model.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({Key? key, this.offer, this.onDelete}) : super(key: key);

  final offerModel? offer;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
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
              // Container(
              //   width: 120,
              //   height: 120,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: Colors.blue, // Add your color here
              //     borderRadius: BorderRadius.circular(20),
              //     boxShadow: const [
              //       BoxShadow(
              //         color: Colors.black12,
              //         blurRadius: 5,
              //         offset: Offset(0, 5),
              //       ),
              //     ],
              //   ),
              //   child: Text(
              //     "Title", // Replace with your actual title
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              // ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer!.title!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Company: ${offer!.company}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Place: ${offer!.place}", // Add the actual place value
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Duration: ${offer!.duration}", // Add the actual duration value
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.edit),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/edit-product',
                              arguments: {
                                'model': offer,
                              },
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: () {
                            onDelete!(offer);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
