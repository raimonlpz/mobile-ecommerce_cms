import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Dark Scarf',
      description: 'Warm and cozy, exactyle what you need',
      price: 39.99,
      imageUrl:
          'https://i.pinimg.com/originals/eb/93/db/eb93db3f5b566b0337ee5162256db94d.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Yellow Pants',
      description: 'Warm and cozy, exactyle what you need',
      price: 12.09,
      imageUrl:
          'https://ae01.alicdn.com/kf/H2a28410f849446b388363596811950bcQ/Hip-Hop-pantal-n-pantalones-de-ch-ndal-de-los-hombres-Streetwear-Bolsillo-grande-pantalones-de.jpg_q50.jpg',
    ),
    Product(
      id: 'p3',
      title: 'White Pants',
      description: 'Warm and cozy, exactyle what you need',
      price: 12.11,
      imageUrl:
          'https://ae01.alicdn.com/kf/Hbc071cfc06eb48309d57500bad341cfdv.jpg_q50.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Black T-Shirt',
      description: 'Warm and cozy, exactyle what you need',
      price: 112.19,
      imageUrl:
          'https://i.pinimg.com/originals/c2/95/e0/c295e00a3ff78691ae96318292a97ff4.jpg',
    ),
  ];

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );

    _items.add(newProduct);
    // _items.insert(0, newProduct); -> at the start of the list

    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
