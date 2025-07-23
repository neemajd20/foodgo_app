import 'package:flutter/material.dart';
import '/models/food_item.dart';
import '/widgets/food_card.dart';
import '/widgets/category_chip.dart';
import '/pages/food_details.dart';


class HomeScreen extends StatelessWidget {
HomeScreen({super.key});
  final List<FoodItem> foodItems = [
    FoodItem(
      id: "Food1",
      title: "Roasted Chicken",
      imagePath: "assets/images/roasted chicken.PNG",
      price: 6.0,
      description:
      "Roast chicken is chicken prepared as food by roasting whether in a home kitchen, over a fire, or with a rotisserie. Generally, the chicken is roasted with its own fat and juices by circulating the meat during roasting...",
    ),
    FoodItem(
      id: "Food2",
      title: "Fried Chicken",
      imagePath: "assets/images/fried-chicken.jpg",
      price: 4.0,
      description:
      "Fried chicken is a dish consisting of chicken pieces that have been coated in a seasoned batter or breading and then deep-fried, pan-fried, or pressure-fried until the outer layer is crispy and golden brown. The inside remains juicy and tender.",
    ),
    FoodItem(
      id: "Food3",
      title: "Hamburger",
      imagePath: "assets/images/hamburger.jpg",
      price: 2.8,
      description:
      "A hamburger, or simply a burger, is a dish consisting of fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. The patties are often served with cheese, lettuce, tomato, onion, pickles, bacon, or condiments like ketchup, mustard, or mayo. A hamburger patty topped with cheese is called a cheeseburger.",
    ),
    FoodItem(
      id: "Food4",
      title: "Cheeseburger",
      imagePath: "assets/images/cheeseburger.PNG",
      price: 3.5,
      description:
      "A cheeseburger is a hamburger with a slice of melted cheese on top of the meat patty, added near the end of the cooking time. Cheeseburgers can include variations in structure, ingredients and composition. As with other hamburgers, a cheeseburger may include condiments and toppings like lettuce, tomato, onion, pickles, bacon, avocado, mushrooms, mayonnaise, ketchup, and mustard.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header and search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        "foodgo",
                        style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/profile.jpg"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "order your Favourite Food",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: "Serif",
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Search bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
                            ],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.search),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                fontFamily: "Serif",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.tune, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Categories
                 const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                     CategoryChip("All", isSelected: true),
                     CategoryChip("Combos"),
                      CategoryChip("Sliders"),
                      CategoryChip("Classic"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Food Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  children: foodItems.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FoodDetailsPage(food: item),
                          ),
                        );
                      },
                      child: FoodCard(item),
                    );
                  }).toList(),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
