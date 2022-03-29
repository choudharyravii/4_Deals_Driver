// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:four_deals_app/Models/data.dart';
import 'package:four_deals_app/Pages/login_page.dart';
import 'package:http/http.dart' as http;
import '../services/sign_up.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  bool _checkboxListTile = false;

  TextEditingController name = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool checkedValue;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                top: Data.height * 5,
                left: Data.height * 3,
                right: Data.height * 3),
            // color: Colors.red,
            child: Column(
              children: [
                Container(
                  width: Data.width * 100,
                  alignment: Alignment.center,
                  child: const Text(
                    "Get Registered",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: Data.height * 1),
                          width: Data.width * 100,
                          child: const Text(
                            "First Name",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: Data.height * 1, top: Data.height * .50),
                            child: TextField(
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                height: .50,
                              ),
                              controller: name,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Name',
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: Data.height * 1),
                          width: Data.width * 100,
                          child: const Text(
                            "Last Name",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: Data.height * 1, top: Data.height * 1),
                            child: TextField(
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                height: .50,
                              ),
                              controller: userName,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter UserName',
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: Data.height * 1),
                          width: Data.width * 100,
                          child: const Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: Data.height * 1, top: Data.height * 1),
                            child: TextField(
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                height: .50,
                              ),
                              controller: email,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Email Address',
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: Data.height * 1),
                          width: Data.width * 100,
                          child: const Text(
                            "Mobile Number",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: Data.height * 1, top: Data.height * 1),
                            child: TextField(
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                height: .50,
                              ),
                              controller: mobile,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Mobile Number',
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: Data.height * 1),
                          width: Data.width * 100,
                          child: const Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: Data.height * 1, top: Data.height * 1),
                            child: TextField(
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                height: .50,
                              ),
                              controller: password,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Password',
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: Data.height * 1),
                          width: Data.width * 100,
                          child: const Text(
                            "Confirm",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: Data.height * 1, top: Data.height * 1),
                            child: TextField(
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                height: .50,
                              ),

                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Password',
                              ),
                            )),
                      ],
                    )),
                CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'By creating an account you agree to our Terms & Conditions.',
                      style: TextStyle(fontSize: 9),
                    ),
                    value: _checkboxListTile,
                    onChanged: (value) {
                      setState(() {
                        _checkboxListTile = !_checkboxListTile;
                      });
                    }),
                Container(
                  padding: EdgeInsets.only(left: Data.width * 1),
                  width: Data.width * 100,
                  height: Data.height * 8,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                      backgroundColor: const Color(0xFF2696CC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () async {
                      var status = await signUp(name.text, userName.text,
                          email.text, password.text, "CUSTOMER", mobile.text);
                      if (status == 200) {
                        Get.to(Login());
                      }
                    },
                    icon: const Icon(
                      Icons.login_sharp,
                      color: Color(0xFFFFFFFF),
                    ),
                    label: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Text("Or sign in with",
                    style: TextStyle(
                      color: Color(0xFF3F3F3F),
                      fontSize: 14,
                    )),
                SizedBox(
                  height: Data.height * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: const Color(0xFFFFFFFF),
                      child: const Image(
                        image: AssetImage('assets/images/icon_google.png'),
                      ),
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: const Color(0xFFFFFFFF),
                      child: const Image(
                        image: AssetImage('assets/images/icon_facebook.png'),
                      ),
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: const Color(0xFFFFFFFF),
                      child: const Image(
                        image: AssetImage('assets/images/icon_apple.png'),
                      ),
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                  ],
                ),
                SizedBox(
                  height: Data.height * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
