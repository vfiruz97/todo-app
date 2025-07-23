import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  final String baseUrl;
  final int retryAttempts;

  const Config({required this.baseUrl, required this.retryAttempts});

  static Future<Config> loadFromDotEnv() async {
    final env = DotEnv();
    await env.load();
    return Config(
      baseUrl: env.get('BASE_URL', fallback: 'http://localhost:8080/api/v1'),
      retryAttempts: int.parse(env.get('RETRY_ATTEMPTS', fallback: '3')),
    );
  }
}
