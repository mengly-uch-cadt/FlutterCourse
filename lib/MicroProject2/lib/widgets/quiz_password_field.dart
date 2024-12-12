import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Color blue300 = Colors.blue[300] as Color;

class QuizPasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPasswordField; // To distinguish password field
  final bool? obscureText;    // Can be used for toggling visibility
  final IconData? icon;       // Optional icon
  final VoidCallback? onIconPressed; // Optional callback for icon action

  const QuizPasswordFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.isPasswordField = false, // Default to false, means not a password field
    this.obscureText = true,      // Default to true for password field
    this.icon,                    // Optional icon
    this.onIconPressed,           // Optional icon press handler
  });

  @override
  // ignore: library_private_types_in_public_api
  QuizPasswordFormFieldState createState() => QuizPasswordFormFieldState();
}

class QuizPasswordFormFieldState extends State<QuizPasswordFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Control obscureText based on visibility toggle
    bool obscureText = widget.isPasswordField ? !_isPasswordVisible : false;

    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText, // Toggle password visibility
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          fontFamily: GoogleFonts.kantumruyPro().fontFamily,
          fontWeight: FontWeight.w100, // Set font weight to normal
          fontSize: 16,
          color: Colors.black, // Adjust to your AppAppColors
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blue300),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blue300),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        // If it's a password field, add the icon to toggle visibility
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null, 
        fillColor: blue300, // Set the fill color
        filled: true, // Enable fill color// If not a password, no icon
      ),
    );
  }
}