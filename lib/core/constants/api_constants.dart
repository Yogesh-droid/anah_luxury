import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['url'] ?? '';
