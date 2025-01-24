import 'package:flutter/material.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_colors.dart';

class LoginTextField extends StatelessWidget {
  final Icon? suffixIcon;
  final String prefixImg;
  final String labelText;
  final VoidCallback? suffixOnTap;
  final bool isObscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Add a validator property

  const LoginTextField({
    super.key,
    required this.controller,
    this.suffixIcon,
    required this.prefixImg,
    this.suffixOnTap,
    this.isObscureText = false,
    this.validator,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        prefixIcon: Image.asset(prefixImg),
        suffixIcon: suffixIcon != null
            ? InkWell(
          onTap: suffixOnTap,
          child: suffixIcon,
        )
            : null,
        border: InputBorder.none,
      ),
      obscureText: isObscureText,
      validator: validator,
      style: TextStyle(color: ViknColors.whiteColor),
    );
  }
}
