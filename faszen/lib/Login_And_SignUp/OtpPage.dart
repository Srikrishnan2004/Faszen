import 'package:faszen/Login_And_SignUp/PasswordPage.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<int> otplist = [-1, -1, -1, -1];
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ENTER OTP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildOtpTextField(index),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOtpTextField(int index) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: otplist[index] == -1 ? Colors.white : Colors.blue,
        border: Border.all(
          color: Colors.blue,
          width: 2.0,
        ),
      ),
      child: Center(
        child: otplist[index] != -1
            ? Text(
                otplist[index].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : TextField(
                showCursor: false,
                focusNode: focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                    // Clear the current OTP digit
                    otplist[index] = -1;
                    // Move focus to the previous TextField
                    if (index > 0) {
                      focusNodes[index - 1].requestFocus();
                    }
                  } else {
                    // Update the OTP digit
                    otplist[index] = int.parse(value);
                    // Move focus to the next TextField
                    if (index < 3) {
                      focusNodes[index + 1].requestFocus();
                    } else {
                      // Check if all OTP digits are entered
                      if (otplist.join() == "1234") {
                        // Navigate to PasswordPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordPage(),
                          ),
                        );
                      }
                    }
                  }
                },
                onSubmitted: (_) {
                  if (index > 0) {
                    // Move focus to the previous TextField
                    focusNodes[index - 1].requestFocus();
                  }
                },
              ),
      ),
    );
  }
}
