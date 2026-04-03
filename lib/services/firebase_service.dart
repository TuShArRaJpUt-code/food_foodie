import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getMenuItems() {
    return _db.collection('menu').snapshots();
  }
  Future<void> placeOrder(List items, double total) async {
    await _db.collection('orders').add({
      'items': items.map((item) => {
        'name': item.name,
        'price': item.price,
        'quantity': item.quantity,
      }).toList(),
      'total': total,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}