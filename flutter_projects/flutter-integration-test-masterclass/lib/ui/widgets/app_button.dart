import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/widgets/activity_indicator.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final double radius;
  final bool outlined;
  final String? title;
  final bool isLoading;
  final Widget? leading;
  final Size? fixedSize;
  final Color textColor;
  final Widget? trailing;
  final double? fontSize;
  final EdgeInsets margin;
  final bool circularShape;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final void Function() onPressed;

  const AppButton({
    super.key,
    this.title,
    this.child,
    this.leading,
    this.fontSize,
    this.trailing,
    this.borderSide,
    this.radius = 10,
    this.backgroundColor,
    this.outlined = false,
    this.isLoading = false,
    required this.onPressed,
    this.circularShape = false,
    this.textColor = Colors.black,
    this.fixedSize = const Size(double.maxFinite, 50),
    this.margin = const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
  });

  ButtonStyle _getButtonStyle(BuildContext context) {
    final theme = Theme.of(context);

    Size? size = fixedSize;
    BorderSide? bs = borderSide;
    Color bgColor = theme.primaryColor;

    if (backgroundColor != null) bgColor = backgroundColor!;
    if (outlined) {
      bgColor = Colors.transparent;
      bs = BorderSide(color: theme.primaryColor, width: 2);
    }

    return ButtonStyle(
      splashFactory: NoSplash.splashFactory,
      side: WidgetStatePropertyAll<BorderSide?>(bs),
      fixedSize: WidgetStatePropertyAll<Size?>(size),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: WidgetStatePropertyAll<EdgeInsets>(padding),
      backgroundColor: WidgetStatePropertyAll<Color>(bgColor),
      overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
      shape: circularShape
          ? const WidgetStatePropertyAll<CircleBorder>(CircleBorder())
          : WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
            ),
    );
  }

  Widget _displayText(BuildContext context, ThemeData theme) {
    Color? color = Colors.grey.shade100;
    if (outlined) {
      color = textColor;
      color = Colors.black;
    }

    final tt = theme.textTheme;

    final text = Text(
      title ?? "-",
      style: TextStyle(
        color: color,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
        fontSize: tt.titleMedium!.fontSize,
      ),
    );

    return text;
  }

  Widget _getChild(BuildContext context) {
    final theme = Theme.of(context);
    if (child != null) return child!;
    if (leading != null || trailing != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 5)],
          _displayText(context, theme),
          if (trailing != null) ...[const SizedBox(width: 5), trailing!],
        ],
      );
    }
    return _displayText(context, theme);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextButton(
        style: _getButtonStyle(context),
        onPressed: () {
          if (isLoading) return;
          onPressed();
        },
        child: isLoading
            ? SizedBox(width: 20, height: 20, child: ActivityIndicator(dark: outlined, strokeWidth: 6))
            : _getChild(context),
      ),
    );
  }
}
