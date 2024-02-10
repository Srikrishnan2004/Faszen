import 'package:faszen/Login_And_SignUp/OtpPage.dart';
import 'package:flutter/material.dart';
import 'package:faszen/Login_And_SignUp/PasswordPage.dart';
import 'package:faszen/HomePage/HomePage.dart';

class LoginPage extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  LoginPage({required this.emailController, super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Row(
            children: [
              SizedBox(width: 20),
              Text("Yay! We found you", style: TextStyle(fontSize: 30)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(widget.emailController.text),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Change",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 0.9 * width,
            child: TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: "PASSWORD",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.lock),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 0.9 * width,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text("LOGIN", style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OtpPage()),
              );
            },
            child: const Text("FORGOT PASSWORD?"),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
