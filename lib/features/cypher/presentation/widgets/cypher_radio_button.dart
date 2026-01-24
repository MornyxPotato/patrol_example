import 'package:flutter/material.dart';
import 'package:patrol_example/core/style.dart';

class CypherRadioButton<T> extends StatelessWidget {
  final T type;
  final String text;
  final Function(T) onTap;

  const CypherRadioButton({
    super.key,
    required this.type,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(type);
      },
      child: Row(
        children: [
          Radio<T>(
            value: type,
            activeColor: AppColors.primaryColor,
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
