import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final itemId = cartItems.keys.elementAt(index);
                final food = cartItems[itemId]!;

                return ListTile(
                  leading: Image.asset(food.imagePath, width: 50, height: 50),
                  title: Text(food.title),
                  subtitle: Text('\$${food.price.toStringAsFixed(2)} x ${food.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => cart.removeFromCart(itemId),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                cart.clearCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Order placed successfully!")),
                );
              },
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
