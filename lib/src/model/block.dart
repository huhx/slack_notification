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
    this.dispatchAction,
    this.optional,
  });

  /// A label that appears above an input element.
  /// Maximum length for this field is 2000 characters.
  final String label;

  /// An plain-text input element, a checkbox element, a radio button element, a select menu element, a multi-select menu element, or a datepicker.
  final Map<String, dynamic> element;

  /// An optional hint that appears below an input element in a lighter grey.
  /// Maximum length for this field is 2000 characters.
  final String? hint;

  /// A boolean that indicates whether or not the use of elements in this block should dispatch a block_actions payload. Defaults to false.
  final bool? dispatchAction;

  /// A boolean that indicates whether the input element may be empty when a user submits the modal. Defaults to false
  final bool? optional;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'input',
      'label': {'type': 'plain_text', 'text': label},
      'element': element,
      if (hint != null) 'hint': {'type': 'plain_text', 'text': hint},
      if (dispatchAction != null) 'dispatch_action': dispatchAction,
      if (optional != null) 'optional': optional,
    };
  }
}

class SectionBlock implements Block {
  SectionBlock({
    this.text,
    this.fields,
    this.accessory,
  });

  /// The text for the block, in the form of a text object. Minimum length for the text in this field is 1 and maximum length is 3000 characters. This field is not required if a valid array of fields objects is provided instead.
  final Map<String, dynamic>? text;

  /// Required if no text is provided. An array of text objects. Any text objects included with fields will be rendered in a compact format that allows for 2 columns of side-by-side text. Maximum number of items is 10. Maximum length for the text in each item is 2000 characters.
  final List<Map<String, dynamic>>? fields;

  /// One of the available element objects.
  final Map<String, dynamic>? accessory;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'section',
      if (text != null) 'text': text,
      if (fields != null) 'fields': fields,
      if (accessory != null) 'accessory': accessory,
    };
  }
}

class VideoBlock implements Block {
  /// A tooltip for the video. Required for accessibility
  final String altText;

  /// Author name to be displayed. Must be less than 50 characters.
  final String? authorName;

  /// Description for video in plain text format.
  final Map<String, dynamic>? description;

  /// Icon for the video provider - ex. Youtube icon
  final String? providerIconUrl;

  /// The originating application or domain of the video ex. Youtube
  final String? providerName;

  /// Video title in plain text format. Must be less than 200 characters.
  final Map<String, dynamic> title;

  /// Hyperlink for the title text. Must correspond to the non-embeddable URL for the video. Must go to an HTTPS URL.
  final String? titleUrl;

  /// The thumbnail image URL
  final String thumbnailUrl;

  /// The URL to be embedded. Must match any existing unfurl domains within the app and point to a HTTPS URL.
  final String videoUrl;

  VideoBlock({
    required this.altText,
    this.authorName,
    this.description,
    this.providerIconUrl,
    this.providerName,
    required this.title,
    this.titleUrl,
    required this.thumbnailUrl,
    required this.videoUrl,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'alt_text': altText,
      if (authorName != null) 'author_name': authorName,
      if (description != null) 'description': description,
      if (providerIconUrl != null) 'provider_icon_url': providerIconUrl,
      if (providerName != null) 'provider_name': providerName,
      'title': title,
      if (titleUrl != null) 'title_url': titleUrl,
      'thumbnail_url': thumbnailUrl,
      'video_url': videoUrl,
    };
  }
}
