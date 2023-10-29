import 'package:clg_project/login_page.dart';
import 'package:clg_project/pages/Product_Catalog_Page.dart';
import 'package:clg_project/pages/Register_page.dart';
import 'package:clg_project/pages/addtocart.dart';
import 'package:clg_project/pages/home_page.dart';
import 'package:clg_project/pages/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final Function(cartItem) addToCart;
  final List<cartItem> cartItems;
  AuthPage({super.key, required this.addToCart, required this.cartItems});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DashBoard(
              cartItems: widget.cartItems,
              addToCart: widget.addToCart,
            );
          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
