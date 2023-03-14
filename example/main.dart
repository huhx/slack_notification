import 'package:dio/dio.dart';
import 'package:slack_notification/slack_notification.dart';

void main(List<String> args) async {
  final Message message = Message(
    text: "person: Hello World. ${DateTime.now()}",
    blocks: [
      SectionBlock(
        text: {
          "type": "mrkdwn",
          "text": "Danny Torrence left the following review for your property:"
        },
      ),
      SectionBlock(
        fields: [
          {"type": "mrkdwn", "text": "*Average Rating*\n1.0"}
        ],
      )
    ],
  );

  final Response<dynamic> response = await Slack("personUrl").send(
    message: message,
  );

  print(response.data);
}
