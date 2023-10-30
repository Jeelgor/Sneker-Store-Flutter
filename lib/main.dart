import 'package:clg_project/firebase_options.dart';
import 'package:clg_project/login_page.dart';
import 'package:clg_project/pages/Product_Catalog_Page.dart';
import 'package:clg_project/pages/Welcome_page.dart';
import 'package:clg_project/pages/addtocart.dart';
import 'package:clg_project/pages/auth_page.dart';
import 'package:clg_project/pages/home_page.dart';
import 'package:clg_project/pages/login_or_register.dart';
import 'package:clg_project/pages/orderdetail_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Activate Firebase App Check
    await FirebaseAppCheck.instance.activate();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(
    MainApp(
      Addtocart: null,
      addToCart: (cartItem) {},
      cartItems: [],
    ),
  );
}

class MainApp extends StatefulWidget {
  final Function(cartItem) addToCart;
  final List<cartItem> cartItems;

  const MainApp({
    super.key,
    required Addtocart,
    required this.addToCart,
    required this.cartItems,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child:
              // OrderDetail(
              //     addToCart: (p0) => Addtocart, cartItems: widget.cartItems)
              AuthPage(
                  addToCart: widget.addToCart, cartItems: widget.cartItems),
          //     DashBoard(
          //   cartItems: widget.cartItems,
          //   addToCart: widget.addToCart,
          // ),

          // LoginPort(
          //   onTap: () {},
          // ),
        ),
      ),
    );
  }
}
