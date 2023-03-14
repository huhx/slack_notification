import 'package:dio/dio.dart';

import 'model/message.dart';
import 'util/dio_client.dart';

class Slack {
  final String baseUrl;

  const Slack(this.baseUrl);

  /// send message
  Future<Response<dynamic>> send({
    String? url,
    required Message message,
  }) async {
    return await RestClient.getInstance().post(
      url ?? baseUrl,
      data: message.toJson(),
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }
}
