import 'package:flutter/material.dart';
import 'package:foodgo_app/pages/main_navigation.dart';
import 'package:foodgo_app/pages/home_screen.dart';
import 'package:foodgo_app/pages/cart_screen.dart';
import 'package:foodgo_app/pages/profile_screen.dart';
import 'package:foodgo_app/placeholder/manage_account_screen.dart';
import 'package:foodgo_app/placeholder/payment_screen.dart';
import 'package:foodgo_app/placeholder/address_screen.dart';
import 'package:foodgo_app/placeholder/notification_screen.dart';
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
        home: const MainNavigation(), // ✅ Start directly at MainNavigation
        routes: {
          '/home': (context) =>  HomeScreen(),
          '/cart': (context) => const CartScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/manage-account': (context) => const ManageAccountScreen(),
          '/payment': (context) => const PaymentScreen(),
          '/address': (context) => const AddressScreen(),
          '/notifications': (context) => const NotificationsScreen(),
        },
      ),
    );
  }
}
