import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/onboarding.dart';
import 'pages/home_screen.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(), // <-- Cart logic available globally
      child: MaterialApp(
        title: 'FoodGo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Onboarding(), 
        routes: {
          '/home': (context) =>  HomeScreen(),
          // Add more routes here, e.g., '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
