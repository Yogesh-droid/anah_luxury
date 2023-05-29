import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['url'] ?? '';  // http://192.168.1.70:3000/api/
