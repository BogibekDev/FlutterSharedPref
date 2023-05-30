import 'package:flutter/material.dart';
import 'package:shared_pref/pages/home_page.dart';
import 'package:shared_pref/pages/signup_page.dart';
import 'package:shared_pref/utils/prefs.dart';

import '../models/signin.dart';

class SignInPage extends StatefulWidget {
  static const String id = "SignInPage";

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome back!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Log in to your existent account of Q Allure",
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: Colors.blueAccent,
                  ),
                  border: InputBorder.none,
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.lock_open_rounded,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Forget Password?",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade900),
              child: MaterialButton(
                onPressed: () {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    SharedPrefs.saveObject(
                      SignIn(
                        _emailController.text,
                        _passwordController.text,
                      ),
                    );
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  }
                },
                child: const Text(
                  "LOG IN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Or connect using",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff1877F2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Image(
                              image: AssetImage("assets/images/img_2.png"),
                              width: 24,
                              height: 24,
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffDB4437),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Image(
                              image: AssetImage("assets/images/img_3.png"),
                              width: 24,
                              height: 24,
                            ),
                            Text(
                              "Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, SignUpPage.id);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
