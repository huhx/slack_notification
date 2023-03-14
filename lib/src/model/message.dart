class Message {
  final String text;

  const Message({required this.text});

  Map<String, String> toJson() {
    return {
      'text': text,
    };
  }
}
