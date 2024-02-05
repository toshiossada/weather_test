import 'dart:io';

typedef CheckInternetLookup = Future<List> Function();

class CheckInternetUsecase {
  final CheckInternetLookup lookup;

  CheckInternetUsecase({required this.lookup});

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
