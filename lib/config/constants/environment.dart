import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDbKey =
      dotenv.env['THE_MOVIEDsB_KEY'] ?? 'Variable de entorno no definida';
}
