import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String newsApiKey = dotenv.env['NEWS_API_KEY'] ?? 'No hay api key';
}
