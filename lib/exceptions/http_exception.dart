import 'package:equatable/equatable.dart';
import 'package:flutter_chat_gpt/shared/widgets/app_notification.dart';
import 'package:overlay_support/overlay_support.dart';

class AppException implements Exception {
  final String message;
  final int statusCode;
  final String identifier;

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  }) {
    showOverlayNotification(
      (context) => AppNotification.error(
        context,
        message,
      ),
    );
  }
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String get identifier => 'Cache failure exception';

  @override
  String get message => 'Unable to save user';

  @override
  int get statusCode => 100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}
