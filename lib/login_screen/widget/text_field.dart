import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    this.sufficon,
    required this.hintText,
    required this.icon,
    required this.inputType,
  });

  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;
  final TextInputType inputType;
  final IconData? sufficon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        controller: textEditingController,
        keyboardType: inputType,
        obscureText: isPass,
        decoration: InputDecoration(
          suffix: Icon(sufficon),
          prefixIcon: Icon(
            icon,
            color: Colors.black45,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18, color: Colors.black45),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.shade300,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
