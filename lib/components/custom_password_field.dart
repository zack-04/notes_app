import 'package:flutter/material.dart';
import 'package:notes_app/utils/validator.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController _password = TextEditingController();
    bool showPassword = false;
    return TextFormField(
      controller: _password,
      validator: Validator.validatePassword,
      obscureText: !showPassword,
      cursorColor: Colors.white70,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        label: const Text('Password'),
        labelStyle: TextStyle(
          color: Colors.white70,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white70,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white70,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            showPassword = !showPassword;
          }),
          child: const Icon(
            Icons.remove_red_eye,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
