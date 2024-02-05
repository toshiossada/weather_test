import 'dart:io';

class CheckInternetUsecase {
  final Future<List> Function() lookup;

  CheckInternetUsecase({required this.lookup});

  Future<bool> call() async {
    try {
      final result = await lookup.call();
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
