import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  // Save order with correct timestamp type (DateTime)
  Future<void> saveOrderToDatabase(String receipt) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("Tidak ada user login");
      return;
    }

    print("Simpan order untuk userId: ${user.uid}");

    await orders.add({
      'userId': user.uid,
      'order': receipt,
      'foodName': "Classic Cheeseburger", 
      'status': 'paid',
      'timestamp': FieldValue.serverTimestamp(), 
    });
  }

  // Optional: Update order status
  Future<void> updateOrderStatus(String docId, String newStatus) async {
    try {
      await orders.doc(docId).update({
        'status': newStatus,
      });
    } catch (e) {
      print("Gagal update status: $e");
    }
  }
}
