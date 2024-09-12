import "package:equatable/equatable.dart";

sealed class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class StorageFailure extends Failure {
  const StorageFailure({required super.message});
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    required super.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => <Object?>[message, statusCode];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[message];
}
