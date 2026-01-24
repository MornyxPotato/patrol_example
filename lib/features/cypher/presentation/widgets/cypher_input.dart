import 'package:flutter/material.dart';
import 'package:patrol_example/core/style.dart';

class CypherInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Function(String) onChanged;
  final Function onClear;

  const CypherInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          suffixIcon: textEditingController.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    onClear();
                  },
                  child: Icon(
                    Icons.clear,
                    color: AppColors.secondaryTextColor,
                  ),
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.secondaryTextColor,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
