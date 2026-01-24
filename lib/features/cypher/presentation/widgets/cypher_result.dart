import 'package:flutter/material.dart';
import 'package:patrol_example/core/style.dart';

class CypherResult extends StatelessWidget {
  final String text;

  const CypherResult({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Result',
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: AppColors.accentPrimaryColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
