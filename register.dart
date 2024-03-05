import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:juicejuice/apithird.dart';
import 'package:juicejuice/logipage.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class Second3 extends StatefulWidget {
  const Second3({super.key});

  @override
  State<Second3> createState() => _Second3State();
}

class _Second3State extends State<Second3> {
  final _fnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'JUICE',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 160, 64),
                            fontSize: 100,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _fnameController,
                        decoration: const InputDecoration(
                            hintText: 'NAME', hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            hintText: 'EMAIL', hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _mobileController,
                        decoration: const InputDecoration(
                            hintText: 'MOBILE', hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'PASSWORD', hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      // const SizedBox(
                      //   height: 25,
                      // ),
                      TextFormField(
                        controller: _repasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'RE ENTER PASSWORD',
                            hintStyle: TextStyle()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        signUpUser();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      child: const Text(
                        'REGISTER NOW',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: Row(
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Second2()));
                          },
                          child: Text('login here'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void signUpUser() async {
    final _fname = _fnameController.text;
    final _email = _emailController.text;
    final _mobile = _mobileController.text;
    final _repassword = _repasswordController.text;
    final _password = _passwordController.text;

    if (_fname.isEmpty) {
      showErrorMessage('Please enter first name');
    } else if (_email.isEmpty) {
      showErrorMessage('Please enter last name');
    } else if (_mobile.isEmpty) {
      showErrorMessage('Please enter email id');
    } else if (_password.isEmpty) {
      showErrorMessage('Please enter mobile number');
    } else if (_repassword.isEmpty) {
      showErrorMessage('Please enter your password');
    } else {
      final _formData = FormData.fromMap({
        'firstname': _fname,
        'email': _email,
        'mobile': _mobile,
        'password': _password,
        're password': _repassword
      });

      final _result = await ApiClass().registerUserApi(_formData);
      if (_result != null) {
        if (_result.status == true) {
          showSuccessMessage(_result.message!);
        } else {
          showErrorMessage(_result.message!);
        }
      }
    }
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

  void showSuccessMessage(String message) {
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
    ).show(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Second2()),
    );
  }
}
