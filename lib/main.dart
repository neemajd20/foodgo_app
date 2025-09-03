import 'package:flutter/material.dart';
import 'package:foodgo_app/pages/cart_screen.dart';
import 'package:foodgo_app/pages/profile_screen.dart';
import 'package:provider/provider.dart';
// import 'package:placeholder/placeholder.dart';

import 'pages/onboarding.dart';
import 'pages/home_screen.dart';
import 'providers/cart_provider.dart';
// import 'pages/profile_screen.dart';
import 'placeholder/manage_account_screen.dart';
import 'placeholder/payment_screen.dart';
import 'placeholder/address_screen.dart';
import 'placeholder/notification_screen.dart';

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
          '/manage-account': (context) => const ManageAccountScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/address': (context) => const AddressScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/cart': (context) => CartScreen(),
        '/profile': (context) => ProfileScreen(),
                  // Add more routes here, e.g., '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
