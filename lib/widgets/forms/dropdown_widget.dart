import 'package:flutter/material.dart';
import 'package:intransporia/theme/theme.dart';
import 'package:intransporia/widgets/forms/form_label.dart';

class DropdownWidget<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final dynamic value;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  final String? hint;

  const DropdownWidget({
    Key? key,
    required this.items,
    this.onChanged,
    required this.value,
    this.labelText,
    this.padding,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 20.0),
      child: DropdownButtonFormField<T>(
        hint: Text(hint ?? ''),
        elevation: 0,
        items: items,
        onChanged: onChanged,
        isExpanded: true,
        value: value,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Constants.borderBase,
        ),
        decoration: InputDecoration(
          label: hint != null ? null : FormLabel(labelText: labelText ?? ''),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
