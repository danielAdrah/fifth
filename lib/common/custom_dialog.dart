import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        height: media.height,
        width: media.width,
        color: Colors.red,
      ),
    );
  }
}
