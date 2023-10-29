// import 'package:clg_project/addtocartshoe/Niket.dart';
// import 'package:clg_project/pages/Product_Catalog_Page.dart';
// import 'package:clg_project/pages/addtocart.dart';
// import 'package:clg_project/pages/orderdetail_page.dart';
// import 'package:flutter/material.dart';

// class NCartPage extends StatefulWidget {
//   final Function(cartItem) addToCart;
//   final List<cartItem> cartItems;

//   // Rename the constructor parameters to avoid naming conflict
//   const NCartPage({
//     Key? key,
//     required this.addToCart,
//     required this.cartItems,
//     required niketCartItems,
//     // required List niketCartItems,
//   }) : super(key: key);

//   @override
//   State<NCartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<NCartPage> {
//   Widget buildCartItems() {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: widget.cartItems.length,
//             itemBuilder: (BuildContext context, int index) {
//               final cartItem = widget.cartItems[index];
//               final isNikeItem = widget.addToCart.contains(cartItem);

//               return ListTile(
//                 subtitle: Column(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => OrderDetail(
//                               cartItems: [],
//                               addToCart: (cartItem) {},
//                             ),
//                           ),
//                         );
//                       },
//                       child: Text('Check Out'),
//                     ),
//                     Center(
//                       child: Container(
//                         // ... (other widget properties)

//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             // ... (other row children)

//                             Column(
//                               children: [
//                                 Container(
//                                   child: Column(children: [
//                                     Text(cartItem.name),
//                                     Text(
//                                       'Size: ${cartItem.size}, Quantity: ${cartItem.quantity.toStringAsFixed(2)}, Price: ${cartItem.price.toStringAsFixed(2)}',
//                                     ),
//                                   ]),
//                                 ),
//                               ],
//                             ),

//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(Icons.remove),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 311),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => DashBoard(
//                       cartItems: widget.cartItems,
//                       addToCart: widget.addToCart,
//                     ),
//                   ),
//                 );
//               },
//               icon: Icon(Icons.arrow_back),
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => DashBoard(
//                     cartItems: widget.cartItems,
//                     addToCart: widget.addToCart,
//                   ),
//                 ),
//               );
//             },
//             icon: Icon(Icons.home),
//           ),
//         ],
//       ),
//       body: buildCartItems(), // Call the buildCartItems function
//     );
//   }
// }
