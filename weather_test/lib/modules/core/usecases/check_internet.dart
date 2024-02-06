import 'dart:io';

/// A typedef for a function that performs an internet connectivity check.
typedef CheckInternetLookup = Future<List> Function();

/// A use case for checking internet connectivity by performing a
/// lookup operation.
///
/// This class provides a method to determine if the device has an active
/// internet
/// connection by executing a provided [lookup] function, which should attempt
/// to
/// resolve a set of addresses.
class CheckInternetUsecase {
  /// Usage:
  /// ```dart
  /// CheckInternetUsecase(
  ///   lookup: () async => [],
  /// )
  /// ```
  CheckInternetUsecase({required this.lookup});

  /// The lookup function to be used for checking internet connectivity.
  final CheckInternetLookup lookup;

  /// Executes the [lookup] function to determine if there is an active internet
  ///
  Future<bool> call() async {
    try {
      final result = await lookup.call();
      if (result.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
