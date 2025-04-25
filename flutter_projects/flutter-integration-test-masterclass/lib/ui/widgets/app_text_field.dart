import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final int? maxLines;
  final bool? isDense;
  final bool readOnly;
  final double? width;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final double? height;
  final bool autofocus;
  final Icon? prefixIcon;
  final String? hintText;
  final bool obscureText;
  final TextStyle? style;
  final BoxBorder? border;
  final Function()? onTap;
  final String? suffixText;
  final Color? cursorColor;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final String? initialValue;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets? contentPadding;
  final EdgeInsets? containerMargin;
  final TextInputType? keyboardType;
  final EdgeInsets? containerPadding;
  final Iterable<String>? autofillHints;
  final void Function(String) onChanged;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.width,
    this.style,
    this.onTap,
    this.label,
    this.suffix,
    this.height,
    this.prefix,
    this.isDense,
    this.hintText,
    this.hintStyle,
    this.validator,
    this.maxLength,
    this.boxShadow,
    this.focusNode,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.cursorColor,
    this.initialValue,
    this.keyboardType,
    this.maxLines = 1,
    this.autofillHints,
    this.contentPadding,
    this.textInputAction,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.autofocus = false,
    required this.onChanged,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.backgroundColor = Colors.white,
    this.textCapitalization = TextCapitalization.none,
    this.border,
    this.borderRadius,
    this.containerPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.containerMargin = const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      margin: containerMargin,
      padding: containerPadding,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        border: border ?? Border.all(width: 1, color: Colors.black26),
      ),
      child: TextFormField(
        onTap: onTap,
        style: style,
        maxLines: maxLines,
        autocorrect: false,
        readOnly: readOnly,
        maxLength: maxLength,
        focusNode: focusNode,
        autofocus: autofocus,
        textAlign: textAlign,
        controller: controller,
        enableSuggestions: true,
        obscureText: obscureText,
        initialValue: initialValue,
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: (v) => onChanged(v.trim()),
        textCapitalization: textCapitalization,
        cursorColor: cursorColor ?? theme.primaryColor,
        validator: validator == null ? null : (v) => validator!(v?.trim()),
        decoration: InputDecoration(
          label: label,
          prefix: prefix,
          suffix: suffix,
          counterText: "",
          isDense: isDense,
          errorMaxLines: 10,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          hintStyle: hintStyle ?? TextStyle(color: Colors.grey.shade700),
        ),
      ),
    );
  }
}
