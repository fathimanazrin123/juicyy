import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:juicejuice/apithird.dart';
import 'package:juicejuice/register.dart';
import 'package:juicejuice/third.dart';

import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Second2 extends StatefulWidget {
  const Second2({Key? key}) : super(key: key);

  @override
  State<Second2> createState() => _Second2State();
}

class _Second2State extends State<Second2> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Center(
            child: Text(
              'JUICE',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 100),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20),
            child: Text(
              'WE MAKE HEALTHY TASTE GOOD',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: 'EMAIL', hintStyle: TextStyle()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  hintText: 'PASSWORD', hintStyle: TextStyle()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                loginuser();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text(
                'LOG IN',
                style: TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>password()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Second3()));
                    },
                    child: Text(
                      'Create new Account',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  void loginuser() async {
    final _email = _emailController.text;
    final _password = _passwordController.text;

    if (_email.isEmpty) {
      showErrorMessage('Please enter email id');
    } else if (_password.isEmpty) {
      showErrorMessage('Please enter your password');
    } else {
      final _formData =
          FormData.fromMap({'email': _email, 'password': _password});

      final _result = await ApiClass().loginUserApi(_formData);

      if (_result != null) {
        if (_result.status == true) {
          saveUserCredentials(_email, _password);

          showSuccessMessage(_result.message!);

          // Navigator.push(context, MaterialPageRoute(builder: (context) => Fmrad()));
          // showSuccessMessage(_result.message!);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Fmrad()));
        } else {
          showErrorMessage(_result.message!);
        }
      }
    }
  }

  Future<void> saveUserCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
  }

  void showErrorMessage(String message) {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context);
  }

  void showSuccessMessage(String message) async {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(await context);
  }
  //   Future<void> logout() async {

  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('email');
  //   await prefs.remove('password');

  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Second3()));
  // }
  //  void initState() {
  //   super.initState();
  //   checkLoggedIn();
  // }

  // void checkLoggedIn() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final email = prefs.getString('email');
  //   final password = prefs.getString('password');

  //   if (email != null && password != null) {

  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => (Second3())));
  //   }
  // }
}
