abstract class Block {
  Map<String, dynamic> toJson();
}

class ActionsBlock implements Block {
  ActionsBlock({required this.elements});

  /// There is a maximum of 5 elements in each action block.
  final List<Map<String, dynamic>> elements;

  @override
  Map<String, dynamic> toJson() {
    return {'type': 'actions', 'elements': elements};
  }
}

class ContextBlock implements Block {
  ContextBlock({required this.elements});

  /// Maximum number of items is 10.
  final List<Map<String, dynamic>> elements;

  @override
  Map<String, dynamic> toJson() {
    return {'type': 'context', 'elements': elements};
  }
}

class DividerBlock extends Block {
  @override
  Map<String, dynamic> toJson() {
    return {'type': 'divider'};
  }
}

class FileBlock implements Block {
  FileBlock({required this.externalId});

  /// The external unique ID for this file.
  final String externalId;

  @override
  Map<String, dynamic> toJson() {
    return {'type': 'file', 'external_id': externalId, 'source': 'remote'};
  }
}

class HeaderBlock implements Block {
  HeaderBlock({required this.text});

  /// The text for the block. Maximum length for this field is 150 characters.
  final String text;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'header',
      'text': {'type': 'plain_text', 'text': text}
    };
  }
}

class ImageBlock implements Block {
  ImageBlock({
    required this.imageUrl,
    required this.altText,
    this.title,
  });

  /// The URL of the image to be displayed.
  /// Maximum length for this field is 3000 characters.
  final String imageUrl;

  /// A plain-text summary of the image.
  /// Maximum length for this field is 2000 characters.
  final String altText;

  /// An optional title for the image.
  /// Maximum length for this field is 2000 characters.
  final String? title;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'image',
      'image_url': imageUrl,
      'alt_text': altText,
      if (title != null) 'title': {'type': 'plain_text', 'text': title},
    };
  }
}

class InputBlock implements Block {
  InputBlock({
    required this.label,
    required this.element,
    this.hint,
  });

  /// A label that appears above an input element.
  /// Maximum length for this field is 2000 characters.
  final String label;

  /// An plain-text input element, a checkbox element, a radio button element, a select menu element, a multi-select menu element, or a datepicker.
  final Map element;

  /// An optional hint that appears below an input element in a lighter grey.
  /// Maximum length for this field is 2000 characters.
  final String? hint;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'input',
      'label': {'type': 'plain_text', 'text': label},
      'element': element,
      if (hint != null) 'hint': {'type': 'plain_text', 'text': hint},
    };
  }
}

class SectionBlock implements Block {
  SectionBlock({
    this.text,
    this.fields,
    this.accessory,
  });

  /// The text for the block.
  /// Maximum length for this field is 3000 characters.
  /// This field is not required if a valid array of `fields` objects is provided instead.
  final String? text;

  /// Required if no `text` is provided.
  /// Any text objects included with `fields` will be rendered in a compact format that allows for 2 columns of side-by-side text.
  /// Maximum number of items is 10.
  /// Maximum length for the `text` in each item is 2000 characters.
  final List<Map>? fields;

  /// One of the available element objects.
  final Map? accessory;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'section',
      if (text != null) 'text': {'type': 'mrkdwn', 'text': text},
      if (fields != null) 'fields': fields,
      if (accessory != null) 'accessory': accessory,
    };
  }
}
