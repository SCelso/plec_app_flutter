import 'package:flutter/material.dart';

class CustomAvatarProfile extends StatelessWidget {
  final Color backgroundColor;
  final String? text;
  const CustomAvatarProfile({
    Key? key,
    required this.backgroundColor,
    this.text = 'def',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Text(
        text!,
      ),
    );
  }
}
