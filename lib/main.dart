import 'package:flutter/material.dart';
import 'package:foodgo_app/pages/main_navigation.dart';
import 'package:foodgo_app/pages/home_screen.dart';
import 'package:foodgo_app/pages/cart_screen.dart' as cart;
import 'package:foodgo_app/pages/profile_screen.dart' as profile;

import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        title: 'FoodGo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainNavigation(), 
        routes: {
          '/home': (context) =>  const HomeScreen(),
          '/cart': (context) => const cart.CartScreen(),
          '/profile': (context) => const profile.ProfileScreen(),
        },
      ),
    );
  }
}
