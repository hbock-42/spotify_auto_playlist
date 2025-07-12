import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_failure.freezed.dart';

@freezed
sealed class StorageFailure with _$StorageFailure {
  factory StorageFailure.notFound(String message) = _NotFound;
  factory StorageFailure.writeError(String message) = _WriteError;
  factory StorageFailure.readError(String message) = _ReadError;
  factory StorageFailure.serializationError(String message) = _SerializationError;
  factory StorageFailure.unknown(String message) = _Unknown;
}