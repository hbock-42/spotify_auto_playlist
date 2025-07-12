import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../config/config_loader.dart';
import '../network/dio_client.dart';

// Config provider - will be overridden with actual config
final configProvider = Provider<AppConfig>((ref) {
  throw Exception('Config not loaded. This should be overridden in main.dart');
});

// Logger provider
final loggerProvider = Provider<Logger>((ref) {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
});

// Secure storage provider
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

// Base Dio client provider
final dioProvider = Provider<Dio>((ref) {
  final logger = ref.watch(loggerProvider);
  return DioClient.createDio(logger: logger);
});

// Spotify API Dio client provider
final spotifyDioProvider = Provider<Dio>((ref) {
  final logger = ref.watch(loggerProvider);
  final config = ref.watch(configProvider);

  return DioClient.createDio(
    baseUrl: config.api.baseUrl,
    logger: logger,
  );
});
