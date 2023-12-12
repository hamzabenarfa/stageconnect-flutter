import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetflutterdev/models/offer/offer_model.dart';
import 'package:projetflutterdev/pages/offer/offer_list.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../components/input.dart';
import '../../components/loginbtn.dart';
import '../../config.dart';
import '../../service/offer_service.dart';

class EditOfferPage extends StatefulWidget {
  const EditOfferPage({Key? key}) : super(key: key);

  @override
  _AddEditOfferPageState createState() => _AddEditOfferPageState();
}

class _AddEditOfferPageState extends State<EditOfferPage> {
  late String offerId;
  late offerModel offer;

  final titleController = TextEditingController();
  final companyController = TextEditingController();
  final placeController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Map<String, dynamic>? arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      offerId = arguments['id'];
      offer = arguments['model'];
      titleController.text = offer.title!;
      companyController.text = offer.company!;
      placeController.text = offer.place!;
    }
  }

  void saveOffer(
      String title,
      String company,
      String place,
      BuildContext context,
      ) async {
    try {
      var offerRequest = offerModel(id: offerId, title: title, company: company, place: place);
      List<offerModel>? offerSuccess = await OfferService.updateOffer(offerId, offerRequest);

      if (offerSuccess != null) {
        showToast('Register successful', context);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OfferList()),
        );
      } else {
        // Handle login failure
        print('Register failed');
        showToast('Register failed. Please check your credentials.', context);
      }
    } catch (e) {
      print(e.toString());
      showToast('Registration failed', context);
    }
  }

  void showToast(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Offer'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Input(
              hintText: 'Title',
              controller: titleController,
              obscureText: false,
            ),
            SizedBox(height: 15),
            Input(
              hintText: 'Company',
              controller: companyController,
              obscureText: false,
            ),
            SizedBox(height: 15),
            Input(
              hintText: 'Place',
              controller: placeController,
              obscureText: false,
            ),
            SizedBox(height: 15),
            LoginBtn(
              text: 'Edit ',
              bgColor: Colors.black,
              onTap: () {
                saveOffer(
                  titleController.text.toString(),
                  companyController.text.toString(),
                  placeController.text.toString(),
                  context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
