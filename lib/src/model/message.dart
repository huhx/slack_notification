import 'block.dart';

class Message {
  final String text;
  final List<Block>? blocks;

  const Message({required this.text, this.blocks});

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      if (blocks != null && blocks!.isNotEmpty)
        'blocks': blocks!.map((e) => e.toJson()).toList(),
    };
  }
}
