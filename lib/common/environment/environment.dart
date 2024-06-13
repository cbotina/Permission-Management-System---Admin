import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {
  static String get backendUrl {
    return dotenv.get('BACKEND_URL');
  }
}
