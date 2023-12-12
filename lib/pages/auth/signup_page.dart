import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetflutterdev/components/input.dart';
import 'package:projetflutterdev/components/loginbtn.dart';
import 'package:projetflutterdev/pages/auth/login_entreprise_page.dart';
import 'package:projetflutterdev/pages/auth/login_page.dart';

import '../../models/auth/request/register_request_user_model.dart';
import '../../service/api_service.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();

  void signUpUser(
      String email,
      String password,
      String name,
      String lastName,
      BuildContext context,
      ) async {
    try {
      var loginRequest = register_request_user_model(email: email, password: password, nom: name, prenom: lastName, role: 'USER');
      register_request_user_model loginSuccess = await APIService.Register(loginRequest);

      if (register_request_user_model != null) {

        showToast('register successful', context);

        // Navigate to the OfferPage upon successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(height: 50),
            Input(
              hintText: 'Name',
              controller: nameController,
              obscureText: false,
            ),
            SizedBox(height: 15),
            Input(
              hintText: 'Last Name',
              controller: lastNameController,
              obscureText: false,
            ),
            SizedBox(height: 15),

            Input(
              hintText: 'email',
              controller: emailController,
              obscureText: false,
            ),
            SizedBox(height: 15),
            Input(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 25),
            LoginBtn(
              text: 'Register',
              bgColor: Colors.black,
              onTap: () {
                signUpUser(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                  nameController.text.toString(),
                  lastNameController.text.toString(),
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
