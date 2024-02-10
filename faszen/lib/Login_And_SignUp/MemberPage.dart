import 'package:faszen/HomePage/HomePage.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});
  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  TextEditingController codecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            children: [
              SizedBox(width: 20),
              Text("Now become our member"),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              SizedBox(width: 20),
              Text("We've sent a code to"),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text("Redikiel@gmail.com"),
              Text(
                "Change",
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 0.9 * width,
            child: TextFormField(
              controller: codecontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Code",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.replay_outlined),
                ),
              ),
            ),
          ),
          Row(children: [
            const SizedBox(width: 20),
            SizedBox(
              width: 0.9 * width,
              child: TextFormField(
                controller: codecontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "First name",
                ),
              ),
            ),
            SizedBox(
              width: 0.9 * width,
              child: TextFormField(
                controller: codecontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Last name",
                ),
              ),
            ),
            const SizedBox(width: 20),
          ]),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 20),
              SizedBox(
                width: 0.9 * width,
                child: TextFormField(
                  controller: passwordcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "PASSWORD",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.lock),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 20),
              Text("Must be atleast 8 characters",
                  style: TextStyle(
                    color: passwordcontroller.text.isEmpty
                        ? Colors.blue
                        : Colors.red,
                  )),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text("Must contain UPPERCASE,lowercase letter",
                  style: TextStyle(
                    color: passwordcontroller.text.isEmpty
                        ? Colors.blue
                        : Colors.red,
                  )),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text("Must have atleast 1 symbol character",
                  style: TextStyle(
                    color: passwordcontroller.text.isEmpty
                        ? Colors.blue
                        : Colors.red,
                  )),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text("Must cannot contain any whitespace",
                  style: TextStyle(
                    color: passwordcontroller.text.isEmpty
                        ? Colors.blue
                        : Colors.red,
                  )),
            ],
          ),
          SizedBox(
            width: 0.9 * width,
            child: RichText(
              textAlign: TextAlign.center,
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
          SizedBox(
            width: 0.9 * width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text("CREATE MY ACCOUNT"),
            ),
          ),
        ],
      ),
    );
  }
}
