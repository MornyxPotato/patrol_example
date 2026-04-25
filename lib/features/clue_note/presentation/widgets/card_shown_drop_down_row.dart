import 'package:flutter/material.dart';

class CardShownDropDownRow extends StatelessWidget {
  final String value;
  final String title;
  final List<String> valueList;
  final Function(String? newValue) onChanged;
  final bool shown;
  final Function(bool?) onShownChanged;

  const CardShownDropDownRow({
    super.key,
    required this.value,
    required this.title,
    required this.valueList,
    required this.onChanged,
    required this.shown,
    required this.onShownChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Checkbox(
            value: shown,
            onChanged: onShownChanged,
          ),
          DropdownButton<String>(
            items: valueList.map((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
            value: value,
            onChanged: shown
                ? (newValue) {
                    onChanged(newValue);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
