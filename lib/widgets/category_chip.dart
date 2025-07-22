import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryChip(this.title, {this.isSelected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isSelected
            ? [const BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))]
            : [],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
