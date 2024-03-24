// ignore_for_file: constant_identifier_names
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:io';

// ignore: non_constant_identifier_names
String API_KEY = dotenv.env["API_KEY"]!;
const String BASE_URL = "https://api.openai.com/v1";
const String DEFAULT_MODEL = "gpt-3.5-turbo-0125";
const String SENTRY_DSN =
    'https://2a99baf4560f5ce49410e06559edbe7e@o4506887876444160.ingest.us.sentry.io/4506887878344704';
const String NEW_CHAT = "new_chat";
final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const int PER_PAGE_LIMIT = 20;
const int LOCALE_STORAGE_ID = 1;
const int THEME_STORAGE_ID = 1;
