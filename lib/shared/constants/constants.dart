// ignore_for_file: constant_identifier_names

import 'dart:io';

const String BASE_URL = "https://eu.neuroapi.host/v1";
const String API_KEY = "sk-Uz5R8ex2p2pOGPY5887cAb4c154b45B7884cE737Df6aBe4c";
const String DEFAULT_MODEL = "gpt-3.5-turbo-0125";
const String SENTRY_DSN =
    'https://2a99baf4560f5ce49410e06559edbe7e@o4506887876444160.ingest.us.sentry.io/4506887878344704';
final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const int PER_PAGE_LIMIT = 20;
const int LOCALE_STORAGE_ID = 1;
const int THEME_STORAGE_ID = 1;
