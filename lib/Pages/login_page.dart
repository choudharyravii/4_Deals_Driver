import 'package:flutter/material.dart';
import 'package:four_deals_app/Models/data.dart';
import 'package:four_deals_app/Pages/dashboard.dart';
import 'package:four_deals_app/Pages/signup_page.dart';
import 'package:get/get.dart';
import '../services/login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(
              top: Data.height * 15,
              left: Data.height * 3,
              right: Data.height * 3),
          // color: Colors.red,
          child: Column(
            children: [
              Container(
                width: Data.width * 100,
                alignment: Alignment.center,
                child: const Text(
                  "Let's Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Data.height * 5),
                width: Data.width * 100,
                child: const Text(
                  "Username or Email",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: Data.height * 1, top: Data.height * 1),
                  child: TextField(
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      height: 1,
                    ),
                    controller: userName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email Address',
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: Data.height * 2),
                width: Data.width * 100,
                child: const Text(
                  "Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: Data.height * 1, top: Data.height * 1),
                  child: TextField(
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      height: 1,
                    ),
                    controller: password,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Password',
                    ),
                  )),
              TextButton(
                style: TextButton.styleFrom(
                    primary: const Color(0xFF646363),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
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
                    var status = await login(userName.text, password.text);
                    if (status == 200) {
                      Get.offAll(DashBoardScreen());
                    }
                  },
                  icon: const Icon(
                    Icons.login_sharp,
                    color: Color(0xFFFFFFFF),
                  ),
                  label: const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: Data.height * 5,
              ),
              const Text("Or sign in with",
                  style: TextStyle(
                    color: Color(0xFF3F3F3F),
                    fontSize: 14,
                  )),
              SizedBox(
                height: Data.height * 5,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: const Color(0xFF2696CC),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                    onPressed: () {
                      _navigateToNextScreen(context);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUp()));
  }
}
