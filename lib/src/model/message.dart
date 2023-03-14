import 'attachment.dart';
import 'block.dart';

class Message {
  final String text;
  final List<Block>? blocks;
  final List<Attachment>? attachments;

  const Message({
    required this.text,
    this.blocks,
    this.attachments,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      if (blocks != null && blocks!.isNotEmpty)
        'blocks': blocks!.map((block) => block.toJson()).toList(),
      if (attachments != null && attachments!.isNotEmpty)
        'attachments':
            attachments!.map((attachment) => attachment.toJson()).toList(),
    };
  }
}
