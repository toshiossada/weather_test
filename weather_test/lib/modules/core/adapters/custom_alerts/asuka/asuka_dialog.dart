import 'package:flutter/material.dart';

import '../dialog_adapter.dart';

/// A typedef for a function that shows a dialog with the given [Widget].
typedef FShowDialog = void Function(Widget);

/// A typedef for a function that shows an alert in the form of a snack bar
/// with the given [String].
typedef FAlert = void Function(String);

/// An implementation of [IDialogAdapter] that uses function callbacks
/// to show dialogs and snack bars.
class AsukaDialog implements IDialogAdapter {
  /// Usage:
  /// ```dart
  /// AsukaDialog(
  ///   fShowDialog: (value){ Asuka.showDialog(builder: (context) => value); },
  ///   fAlert: (value){ Asuka.shoAlert(builder: (context) => value); },
  /// )
  /// ```
  AsukaDialog({
    required this.fShowDialog,
    required this.fAlert,
  });

  /// The function callback used to show a dialog.
  final FShowDialog fShowDialog;

  /// The function callback used to show a snack bar alert.
  final FAlert fAlert;

  @override
  void showDialog(Widget child) {
    fShowDialog(child);
  }

  @override
  void alertSnackBar(String text) {
    fAlert(text);
  }
}
