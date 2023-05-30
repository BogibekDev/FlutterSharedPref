import 'package:flutter/material.dart';
import 'package:shared_pref/models/signup.dart';
import 'package:shared_pref/pages/home_page.dart';
import 'package:shared_pref/pages/signin_page.dart';
import 'package:shared_pref/utils/secure_prefs.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "SignUpPage";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignInPage.id);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                "Let's Get Started!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                "Created an account to Q Alkure to get all features",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
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
                  hintText: "Azamatjon",
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
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.phone_android_outlined,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  hintText: "Phone",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
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
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: _conformPasswordController,
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
                  hintText: "Conform password",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade900),
              child: MaterialButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty ||
                      _emailController.text.isNotEmpty ||
                      _phoneController.text.isNotEmpty ||
                      _passwordController.text.isNotEmpty ||
                      _conformPasswordController.text.isNotEmpty) {
                    var name = _nameController.text;
                    var email = _emailController.text;
                    var phoneNumber = _phoneController.text;
                    var password = _passwordController.text;
                    var confpassword = _conformPasswordController.text;
                    if (password == confpassword) {
                      var account = Account(name, email, phoneNumber, password);
                      SecurePrefs.storeAccount(account);
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    }
                  }
                },
                child: const Text(
                  "CREATE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignInPage.id);
                    },
                    child: const Text(
                      "Login here",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
