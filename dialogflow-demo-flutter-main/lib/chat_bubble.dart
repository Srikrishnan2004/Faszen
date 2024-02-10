import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    this.text,
    this.name,
    this.type,
    this.title,
    this.subtitle,
    this.imageUrl,
    this.buttontext,
    this.buttonurl,
  }) : super(key: key);

  final String? text;
  final String? name;
  final bool? type;
  final String? title, subtitle, imageUrl, buttontext, buttonurl;

  Future<void> _launchWebPage(String url) async {
    if (!await canLaunch(url)) {
      throw 'Could not launch $url';
    }
    await launch(url);
  }

  Widget _buildMessageContent(BuildContext context, boolean) {
    if (title != null &&
        subtitle != null &&
        imageUrl != null &&
        buttontext != null &&
        buttonurl != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title!,
              style: const TextStyle(
                color: Colors.white,
              )),
          Text(subtitle!,
              style: const TextStyle(
                color: Colors.white,
              )),
          Image.network(
            imageUrl!,
            height: 30,
            width: 30,
            fit: BoxFit.fill,
          ),
          ElevatedButton(
            onPressed: () {
              _launchWebPage(buttonurl!);
            },
            child: Text(buttontext!, style: const TextStyle()),
          ),
        ],
      );
    }
    return Text(
      text ?? "",
      style: TextStyle(
        color: type ?? false ? Colors.black : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      alignment: type ?? false ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: type ?? false ? Colors.grey : Colors.black,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: _buildMessageContent(context, type),
      ),
    );
  }
}
