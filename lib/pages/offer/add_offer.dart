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

class AddOfferPage extends StatefulWidget {
  const AddOfferPage({Key? key}) : super(key: key);

  @override
  _AddEditOfferPageState createState() => _AddEditOfferPageState();
}

class _AddEditOfferPageState extends State<AddOfferPage> {

  final titleController = TextEditingController();
  final companyController = TextEditingController();
  final placeController = TextEditingController();


  void saveOffer(
      String title,
      String company,
      String place,

      BuildContext context,
      ) async {
    try {

      var offerRequest = offerModel( title: title, company: company, place: place);
      List<offerModel>? offerSuccess = await OfferService.SaveOffer(offerRequest);

      if (offerSuccess == null ) {

        showToast('register successful', context);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OfferList()),
        );
      }
      else {
        // Handle login failure
        print('register failed');
        showToast('register failed. Please check your credentials.', context);
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
        title: const Text('Add Offer'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(height: 50),
            Input(
              hintText: 'title',
              controller: titleController,
              obscureText: false,
            ),
            SizedBox(height: 15),
            Input(
              hintText: 'company',
              controller: companyController,
              obscureText: false,
            ),
            SizedBox(height: 15),

            Input(
              hintText: 'place',
              controller: placeController,
              obscureText: false,
            ),
            SizedBox(height: 15),

            LoginBtn(
              text: 'Save',
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
