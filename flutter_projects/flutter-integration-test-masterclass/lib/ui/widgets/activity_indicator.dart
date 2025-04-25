import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  final bool dark;
  final double strokeWidth;

  const ActivityIndicator({super.key, this.dark = false, this.strokeWidth = 6});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        strokeCap: StrokeCap.round,
        color: dark ? theme.primaryColor : theme.colorScheme.surface,
      ),
    );
  }
}
