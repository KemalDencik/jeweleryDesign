import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({
    super.key,
    required this.formText,
  });
  final String formText;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: _mediaQuery.size.height * 0.1,
      width: _mediaQuery.size.width * 0.45,
      child: TextFormField(
        style: const TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
        cursorColor: const Color.fromARGB(255, 11, 11, 11),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          label: Text(
            widget.formText,
            style: const TextStyle(
              color: Color.fromARGB(255, 48, 46, 46),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 98, 97, 97),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 98, 97, 97),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
