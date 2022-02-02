import 'package:flutter/material.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? hintText;
  final Color? hintColor;
  final Color? fillColor;

  final Function(String)? onSaved;
  // final Widget? prefix;

  const BoxTextField({
    Key? key,
    required this.controller,
    this.validator,
    required this.keyboardType ,
     this.obsecure = false,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.enabled = true,
    this.onEditingCompleted,
    this.onChanged,
    required this.hintText,
    this.fillColor,
    this.hintColor,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final outputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(10)
    );
    return TextFormField(
        onChanged: onChanged,
        onEditingComplete: onEditingCompleted,
        autofocus: autofocus,
        onTap: onTap,
        enabled: enabled,
        readOnly: readOnly,
        obscureText: obsecure,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          border: outputBorder,
          focusedBorder: outputBorder,
          enabledBorder: outputBorder,
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          errorText: errorText,
          contentPadding: const EdgeInsets.all(12),
        ),
        validator: validator);
  }
}
