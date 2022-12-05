// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/typography/app_typography.dart';

class StandardTextField extends StatelessWidget {
  const StandardTextField({
    Key? key,
    this.width,
    this.textFieldColor,
    this.borderColor,
    this.labelText,
    this.label,
    this.floatingLabelStyle,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.prefixTextStyle,
    this.controller,
    this.maxLines = 1,
    this.showPrefixIcon = true,
    this.showSuffixIcon = true,
    this.prefixText,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.textAlign = TextAlign.left,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.isEnabled = true,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.maxLength,
    this.inputBorder,
    this.inputFormatter,
    this.autoFocus = false,
    this.focusNode,
    this.validator,
    this.autovalidateMode,
    this.fillColor,
  }) : super(key: key);

  final double? width;
  final Color? textFieldColor;
  final Color? borderColor;
  final String? labelText;
  final Widget? label;
  final int? maxLines;
  final TextStyle? floatingLabelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? prefixTextStyle;
  final TextEditingController? controller;
  final Widget? prefixWidget;
  final String? prefixText;
  final Widget? suffixWidget;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String? value)? onSaved;
  final void Function()? onTap;
  final void Function()? onEditingComplete;

  final bool showPrefixIcon;
  final bool showSuffixIcon;
  final bool isEnabled;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final int? maxLength;
  final Color? fillColor;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final InputBorder? inputBorder;
  final List<TextInputFormatter>? inputFormatter;
  final bool autoFocus;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      maxLines: maxLines,
      style: AppTypography.label.copyWith(
        color: context.theme.corePalatte.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? context.theme.corePalatte.gray10,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.corePalatte.errorColor,
          ),
        ),
        errorStyle: AppTypography.label.copyWith(
            color: context.theme.corePalatte.errorColor, fontSize: 12),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.corePalatte.errorColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.corePalatte.lightGreyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.corePalatte.lightGreyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.corePalatte.lightGreyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
        label: label,
        floatingLabelStyle: floatingLabelStyle ??
            TextStyle(
              color: context.theme.corePalatte.gray30,
            ),
        hintText: hintText,
        hintStyle: hintStyle ??
            AppTypography.label.copyWith(
                color: context.theme.corePalatte.gray30, fontSize: 14),
        border: inputBorder,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.flexibleHeight,
          horizontal: 12.flexibleWidth,
        ),
        labelStyle: labelStyle,
        suffixIcon: showSuffixIcon ? suffixWidget : null,
        prefixIcon: showPrefixIcon ? prefixWidget : null,
        prefixText: prefixText,
        prefixStyle: prefixTextStyle ??
            AppTypography.bodyMedium.copyWith(
              fontSize: 14.flexibleFontSize,
              color: context.theme.textColor,
            ),
        counterText: '',
      ),
      controller: controller,
      textAlign: textAlign,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onTap: onTap,
      enabled: isEnabled,
      inputFormatters: inputFormatter,
      autofocus: autoFocus,
      focusNode: focusNode,
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}
