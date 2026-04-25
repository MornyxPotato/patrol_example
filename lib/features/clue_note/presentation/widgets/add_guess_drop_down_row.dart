import 'package:flutter/material.dart';

class AddGuessDropDownRow extends StatelessWidget {
  final String value;
  final String title;
  final List<String> valueList;
  final Function(String? newValue) onChanged;

  const AddGuessDropDownRow({
    super.key,
    required this.value,
    required this.title,
    required this.valueList,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          DropdownButton<String>(
            items: valueList.map((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
            value: value,
            onChanged: (newValue) {
              onChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}
