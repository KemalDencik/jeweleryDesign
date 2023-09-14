import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsWidget extends StatefulWidget {
  const ContactUsWidget({super.key, required this.iconPath, required this.contactName});

  final RxString iconPath;
  final RxString contactName;

  @override
  State<ContactUsWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: Image.asset(widget.iconPath.value),
          ),
        ),
        Text(
          widget.contactName.value,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
