import 'package:faszen/Login_And_SignUp/EmailPage.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController passwordController = TextEditingController();

  bool isLengthValid(String value) {
    return value.length >= 8;
  }

  bool hasUpperCase(String value) {
    return value.contains(RegExp(r'[A-Z]'));
  }

  bool hasLowerCase(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }

  bool hasSymbol(String value) {
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  bool hasNoWhiteSpace(String value) {
    return !value.contains(RegExp(r'\s'));
  }

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHANGE YOUR PASSWORD"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              SizedBox(
                width: 0.9 * width,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !isVisible,
                  keyboardType: TextInputType.text,
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
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                "Must be at least 8 characters",
                style: TextStyle(
                  color: passwordController.text.isEmpty
                      ? Colors.grey
                      : isLengthValid(passwordController.text)
                          ? Colors.green
                          : Colors.red,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                "Must contain UPPERCASE letter",
                style: TextStyle(
                  color: passwordController.text.isEmpty
                      ? Colors.grey
                      : hasUpperCase(passwordController.text)
                          ? Colors.green
                          : Colors.red,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                "Must contain lowercase letter",
                style: TextStyle(
                  color: passwordController.text.isEmpty
                      ? Colors.grey
                      : hasLowerCase(passwordController.text)
                          ? Colors.green
                          : Colors.red,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                "Must contain at least 1 symbol character",
                style: TextStyle(
                  color: passwordController.text.isEmpty
                      ? Colors.grey
                      : hasSymbol(passwordController.text)
                          ? Colors.green
                          : Colors.red,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                "Must not contain any whitespace",
                style: TextStyle(
                  color: passwordController.text.isEmpty
                      ? Colors.grey
                      : hasNoWhiteSpace(passwordController.text)
                          ? Colors.green
                          : Colors.red,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 0.9 * width,
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              child: const Text("CHANGE MY PASSWORD"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmailPage()));
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
