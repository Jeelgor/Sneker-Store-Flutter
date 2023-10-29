import 'package:clg_project/pages/Product_Catalog_Page.dart';
import 'package:clg_project/pages/addtocart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  final Function(cartItem) addToCart;
  final List<cartItem> cartItems;
  const OrderDetail(
      {super.key, required this.addToCart, required this.cartItems});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  // final TextEditingController shoe_nameController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when they are no longer needed.
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Fill Your Order Details!', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Id',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone No',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: addressController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: pincodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Pincode',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // ... (previous code)

            ElevatedButton(
              onPressed: () async {
                // Get the order details from the form fields
                final name = nameController.text;
                final email = emailController.text;
                final phone = phoneController.text;
                final address = addressController.text;
                final pincode = pincodeController.text;

                // Create a Firestore instance
                final firestore = FirebaseFirestore.instance;

                try {
                  // Add the order details to Firestore
                  final orderDocRef = await firestore.collection('orders').add({
                    'name': name,
                    'email': email,
                    'phone': phone,
                    'address': address,
                    'pincode': pincode,
                    // Add any other fields you need
                  });

                  // Save the cart data to a separate collection
                  final cartData = widget.cartItems.map((cartItem) {
                    return {
                      'productName': cartItem.name,
                      'size': cartItem.size,
                      'quantity': cartItem.quantity,
                      'price': cartItem.price,
                    };
                  }).toList();

                  await firestore.collection('cartItems').add({
                    'orderId': orderDocRef.id, // Link cart items to the order
                    'items': cartData,
                  });

                  // Data successfully stored in Firestore
                  print('Order details and cart data stored in Firestore');
                } catch (e) {
                  // Handle any errors that occur during data storage
                  print('Error storing order details and cart data: $e');
                }

                // Navigate to the dashboard or another screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashBoard(
                      cartItems: widget.cartItems,
                      addToCart: widget.addToCart,
                    ),
                  ),
                );
              },
              child: Text('Submit Order'),
            ),

// ... (rest of your code)
          ],
        ),
      ),
    );
  }
}
