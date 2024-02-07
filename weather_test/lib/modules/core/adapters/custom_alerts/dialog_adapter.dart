import 'package:flutter/widgets.dart';

/// An abstract interface that defines the contract for displaying dialogs
/// and snack bars.
abstract class IDialogAdapter {
  /// Displays a dialog with the given [child] widget.
  void showDialog(Widget child);

  /// Displays a snack bar with the given [text].
  void alertSnackBar(String text);
}
