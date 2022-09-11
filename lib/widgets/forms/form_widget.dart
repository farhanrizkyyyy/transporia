import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intransporia/widgets/forms/form_label.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;

  const FormWidget({
    Key? key,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.padding,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          hintText: hintText,
          label:
              hintText != null ? null : FormLabel(labelText: labelText ?? ''),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
