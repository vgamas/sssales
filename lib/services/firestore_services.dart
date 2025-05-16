import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obtener todos los productos
  Stream<List<Product>> getProducts() {
    return _firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    });
  }

  // Añadir un nuevo producto (solo para admin)
  Future<void> addProduct(Product product) {
    return _firestore.collection('products').add({
      'name': product.name,
      'price': product.price,
      'description': product.description,
      'image': product.image,
      'stock': product.stock,
    });
  }
}