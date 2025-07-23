import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodCard extends StatelessWidget {
  final FoodItem item;

  const FoodCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow:const [ BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Lobster",
            ),
          ),
        ],
      ),
    );
  }
}
