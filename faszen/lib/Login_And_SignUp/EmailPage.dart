import 'package:faszen/Login_And_SignUp/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailPage extends StatelessWidget {
  EmailPage({super.key});
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              SizedBox(
                width: 0.9 * width,
                child: Text(
                  "Enter your email to join us or sign in",
                  style: GoogleFonts.poppins(
                      fontSize: 30, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 0.9 * width,
                child: TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Your Email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.mail),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 0.9 * width,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: """By click "Continue", you agreed to our """,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          )),
                      TextSpan(
                        text: "Privacy Policies",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 1.0,
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: "terms of use",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 1.0,
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 0.9 * width,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailcontroller.text.endsWith("@gmail.com") ||
                        emailcontroller.text.endsWith("@yahoo.com") ||
                        emailcontroller.text.endsWith("@hotmail.com")) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage(emailController: emailcontroller)),
                      );
                    }
                  },
                  child: const Text("CONTINUE"),
                ),
              ),
              const Spacer(),
              Text(
                "Or continue with",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  Image.asset(
                    "assets/Picture1.png",
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    "assets/Picture2.png",
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    "assets/Picture3.png",
                    height: 48,
                    width: 48,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 30),
            ]),
      ),
    );
  }
}
