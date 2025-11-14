import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:logging/logging.dart';

class ApiClient extends http.BaseClient {
  ApiClient()
    : _inner = RetryClient.withDelays(http.Client(), [
        Duration(milliseconds: 200),
        Duration(milliseconds: 400),
        Duration(milliseconds: 800),
      ]);

  final http.Client _inner;

  final _logger = Logger('ApiClient');

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    _logger.info(
      'Sending request: $request\nRequest headers: ${request.headers}',
    );
    return _inner.send(request);
  }
}
