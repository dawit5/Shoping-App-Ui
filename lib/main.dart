import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart_provider.dart';
import 'home_page.dart';

void main() {
  runApp(const shoping());
}

class shoping extends StatelessWidget {
  const shoping({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: "Shopping App",
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(255, 0, 0, 1),
                primary: const Color.fromRGBO(254, 206, 1, 1)),
            textTheme: const TextTheme(
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                titleLarge:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
            useMaterial3: true),
        home: HomePage(),
      ),
    );
  }
}
