import 'package:flutter/material.dart';
import 'package:flutter_starter/main.dart';

enum SnackStatus { success, error, info, warning }

class AppSnackBar {
  final String message;
  final SnackStatus type;
  SnackBarAction? action;

  AppSnackBar({required this.message, this.type = SnackStatus.success, this.action}) {
    rootScaffoldMessengerKey.currentState!.clearSnackBars();

    IconData icon;
    String msg = message;
    Color textColor = Colors.white;
    Color backgroundColor = Colors.black87;

    switch (type) {
      case SnackStatus.success:
        icon = Icons.check_circle;
        break;
      case SnackStatus.error:
        icon = Icons.error;
        backgroundColor = Colors.red.shade700;
        msg = message.characters.take(90).toString();
        break;
      case SnackStatus.warning:
        icon = Icons.warning;
        break;
      case SnackStatus.info:
        icon = Icons.info;
        break;
    }

    rootScaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        elevation: 10,
        showCloseIcon: true,
        clipBehavior: Clip.none,
        closeIconColor: textColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.only(left: 15, right: 0, top: 15, bottom: 15),
        content: Row(
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 5),
            Flexible(
              child: Text(msg, style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
