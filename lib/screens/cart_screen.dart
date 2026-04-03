import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../services/firebase_service.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                var item = cart.items[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("₹${item.price} x ${item.quantity}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          cart.decreaseQty(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          cart.increaseQty(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // 🔥 THIS WAS MISSING (CRITICAL PART)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  "Total: ₹${cart.totalPrice}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: cart.items.isEmpty
                      ? null
                      : () async {
                    await FirebaseService().placeOrder(
                      cart.items,
                      cart.totalPrice,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Order Placed Successfully")),
                    );

                    cart.clearCart();
                  },
                  child: Text("Place Order"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}