import 'dart:async';
import 'package:dialogflow_demo_flutter/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // message text controller
  final TextEditingController _textController = TextEditingController();

  // list of messages that will be displayed on the screen
  final List<ChatMessage> _messages = <ChatMessage>[];

  // for changing recording icon
  bool _isRecording = false;

  late final SpeechToText speechToText;
  late StreamSubscription _recorderStatus;
  late StreamSubscription<List<int>> _audioStreamSubscription;
  late DialogflowGrpcV2Beta1 dialogflow;

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  Future<void> initPlugin() async {
    // initializing speech t otext plugin
    speechToText = SpeechToText();

    // requiried for setting up dialogflow
    final serviceAccount = ServiceAccount.fromString(
      await rootBundle.loadString(
        'assets/river-autumn-409316-d6f8dfd5297b.json',
      ),
    );

    // dialogflow setup
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
    setState(() {});

    // Initialize speech recognition services, returns true if successful, false if failed.
    await speechToText.initialize(
      options: [SpeechToText.androidIntentLookup],
    );
  }

  void stopStream() async {
    await _audioStreamSubscription.cancel();
  }

  void handleSubmitted(text) async {
    _textController.clear();

    if (text.toString().isEmpty) {
      return;
    }

    ChatMessage message = ChatMessage(
      text: text,
      name: "You",
      type: true,
    );

    setState(() {
      _messages.insert(0, message);
    });

    // callling dialogflow api
    DetectIntentResponse data = await dialogflow.detectIntent(text, 'en-US');
    print(data);

    // getting meaningful response text
    String fulfillmentText = data.queryResult.fulfillmentText;
    String title = "";
    String subtitle = "";
    String imageUrl = "";
    String buttontext = "";
    String buttonUrl = "";
    if (fulfillmentText.isNotEmpty) {
      ChatMessage botMessage = ChatMessage(
        text: fulfillmentText,
        name: "Bot",
        type: false,
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    }
    if (data.queryResult.fulfillmentMessages.isNotEmpty) {
      var card = data.queryResult.fulfillmentMessages[0].card;
      title = card.title;
      subtitle = card.subtitle;
      imageUrl = card.imageUri;
      buttontext = card.buttons[0].text;
      buttonUrl = card.buttons.length > 1 ? card.buttons[1].postback : '';
      print(title);
      ChatMessage botMessage = ChatMessage(
        title: title,
        subtitle: subtitle,
        imageUrl: imageUrl,
        buttontext: buttontext,
        buttonurl: buttonUrl,
        name: "Bot",
        type: false,
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) async {
    String lastWords = result.recognizedWords;

    // setting textediting controller to the speech value and moving cursor at the end
    _textController.text = lastWords;
    _textController.selection = TextSelection.collapsed(
      offset: _textController.text.length,
    );

    setState(() {
      _isRecording = false;
    });
    await Future.delayed(const Duration(seconds: 5));
    _stopListening();
  }

  void handleStream() async {
    setState(() {
      _isRecording = true;
    });
    await speechToText.listen(
      onResult: _onSpeechResult,
    );
  }

  void _stopListening() async {
    await speechToText.stop();
  }

  @override
  void dispose() {
    _recorderStatus.cancel();
    _audioStreamSubscription.cancel();
    speechToText.stop();
    super.dispose();
  }

  // The chat interface
  //
  //------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          title: const Text(
            "Chat With Fizard",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle search action
              },
            ),
            GestureDetector(
              onTap: () {
                // Handle notifications action
              },
              child: Image.asset(
                'assets/wardrobe.png', // Replace with your image path
                width: 20, // Adjust width as needed
                height: 20, // Adjust height as needed
              ),
            ),
            IconButton(
              icon: const Icon(Icons.warning_amber_rounded),
              onPressed: () {
                // Handle menu action
              },
            ),
          ]),
      body: Stack(children: [
          Container(
          // width: double.infinity,
          // height:double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/MobileView.png"),
                fit: BoxFit.fill,
              )),
          ),
        Column(
          children: [
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (ctx, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: _textController,
                      onSubmitted: handleSubmitted,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Ask Frazen"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => handleSubmitted(_textController.text),
                    ),
                  ),
                  IconButton(
                      iconSize: 30.0,
                      icon: Icon(_isRecording ? Icons.mic : Icons.mic_off),
                      onPressed: () {
                        handleStream();
                      }),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
