import 'dart:io';

import 'package:dio/dio.dart';
import 'package:slack_notification/slack_notification.dart';
import 'package:slack_notification/src/model/block.dart';
import 'package:slack_notification/src/model/message.dart';
import 'package:test/test.dart';

void main() {
  late String personUrl, channelUrl;

  setUpAll(() {
    final Map<String, String> env = Platform.environment;
    personUrl = env['slack_person_url'] ?? "";
    channelUrl = env['slack_channel_url'] ?? "";
  });

  test('send message to person', () async {
    final Message message = Message(
      text: "person: Hello World. ${DateTime.now()}",
      blocks: [
        SectionBlock(
          text: "Danny Torrence left the following review for your property:",
        ),
        SectionBlock(
          fields: [
            {"type": "mrkdwn", "text": "*Average Rating*\n1.0"}
          ],
        )
      ],
    );

    final Response<dynamic> response = await Slack(personUrl).send(
      message: message,
    );

    expect(response.statusCode, 200);
    expect(response.data, "ok");
  });

  test('send message to channel', () async {
    final Message message = Message(
      text: "channel: Hello World. ${DateTime.now()}",
    );

    final Response<dynamic> response = await Slack(channelUrl).send(
      message: message,
    );

    expect(response.statusCode, 200);
    expect(response.data, "ok");
  });
}
