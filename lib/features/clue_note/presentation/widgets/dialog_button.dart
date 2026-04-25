import 'package:flutter/material.dart';
import 'package:patrol_example/core/style.dart';

class DialogButton extends StatelessWidget {
  final Function onPressed;
  final String textButton;

  const DialogButton({
    super.key,
    required this.onPressed,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          textButton,
          style: TextStyle(
            color: AppColors.textOrIconColor,
          ),
        ),
      ),
    );
  }
}
