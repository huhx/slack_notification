## Features
Incoming Webhooks are a simple way to post messages from apps into Slack. Creating an Incoming Webhook gives you a unique URL to which you send a JSON payload with the message text and some options. You can use all the usual formatting and layout blocks with Incoming Webhooks to make the messages stand out.

**flutter pub**: [https://pub.dev/packages/slack_notification](https://pub.dev/packages/slack_notification)

## Getting started
Before use Incoming Webhooks, we need to create `Slack` app. The setup link: https://api.slack.com/messaging/webhooks


## Usage
After create `Slack` and add `Webhooks`, remeber the Webhook URL(this data is sentive include secret, just be careful).
### Add dependencies
```yaml
dependencies:
  slack_notification: ^1.2.0
```

### Simple usage
```dart
final Message message = Message(
    text: "person: Hello World. ${DateTime.now()}",
);

final Response<dynamic> response = await Slack(webHookUrl).send(
    message: message,
);
```

### Advance usage
```dart
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
```

`Block` or `Attachment`, refer to:
* Block：https://api.slack.com/reference/block-kit/blocks
* Attachents: https://api.slack.com/reference/messaging/attachments
> This feature of `Attachents` is a legacy part of messaging functionality for Slack apps. We recommend you stick with layout `blocks`

## Drop a ⭐ if it is help to you.