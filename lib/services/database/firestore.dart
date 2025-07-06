import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  /// Menyimpan order ke database dengan detail makanan dan struk
  Future<void> saveOrderToDatabase({
  required String receipt,
  required String foodName,
  required double totalPrice,
}) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    print("❌ Tidak ada user login");
    return;
  }

  try {
    final orderData = {
      'userId': user.uid,
      'status': 'paid',
      'timestamp': FieldValue.serverTimestamp(),
      'receipt': receipt,
      'food': {
        'name': foodName,
        'price': totalPrice,
      }
    };

    DocumentReference docRef = await orders.add(orderData);
    print("✅ Order berhasil disimpan dengan ID: ${docRef.id}");
  } catch (e) {
    print("❌ Gagal menyimpan order: $e");
    rethrow;
  }
}
}