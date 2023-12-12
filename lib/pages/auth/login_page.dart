import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetflutterdev/components/input.dart';
import 'package:projetflutterdev/components/loginbtn.dart';
import 'package:projetflutterdev/pages/auth/login_entreprise_page.dart';
import 'package:projetflutterdev/pages/auth/signup_page.dart';
import 'package:projetflutterdev/pages/offer_page.dart';

import '../../models/auth/request/login_request_user_model.dart';
import '../../service/api_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(String email, password, BuildContext context) async {
    try {

      var loginRequest = login_request_user_model(email: email, password: password);

      bool loginSuccess = await APIService.login(loginRequest);

      if (loginSuccess) {
        print('User logged in');
        showToast('Login successful', context);

        // Navigate to the OfferPage upon successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OfferPage()),
        );
      } else {
        // Handle login failure
        print('Login failed');
        showToast('Login failed. Please check your credentials.', context);
      }
    } catch (e) {
      print(e.toString());
      showToast('An error occurred during login.', context);
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
            Image.asset('lib/images/login.png', height: 250, width: 500),
            SizedBox(height: 20),
            Text(
              'Welcome to Stage Connect',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 40),
            Input(
              hintText: 'Email',
              controller: emailController,
              obscureText: false,
            ),
            SizedBox(height: 15),
            Input(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'You dont have acount?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            LoginBtn(
              text: 'Login',
              bgColor: Colors.black,
              onTap: () {
                signUserIn(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                  context,
                );
              },
            ),
            SizedBox(height: 15),
            LoginBtn(
              text: 'Log in As Entreprise',
              bgColor: Colors.grey[600] ?? Colors.grey,
              onTap: () {
                print('Button tapped - navigating to LoginEntreprisePage');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginEntreprisePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

