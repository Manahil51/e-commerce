import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WishlistViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> _wishlist = [];

  List<Map<String, dynamic>> get wishlist => _wishlist;

  WishlistViewModel() {
    _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final String? wishlistString = prefs.getString('wishlist');
    if (wishlistString != null) {
      _wishlist = List<Map<String, dynamic>>.from(json.decode(wishlistString));
      notifyListeners();
    }
  }

  void addToWishlist(Map<String, dynamic> product) async {
    _wishlist.add(product);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('wishlist', json.encode(_wishlist));
    notifyListeners();
  }

  void removeFromWishlist(int index) async {
    _wishlist.removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('wishlist', json.encode(_wishlist));
    notifyListeners();
  }

  double get totalAmount {
    return _wishlist.fold(
        0, (sum, item) => sum + (double.tryParse(item['price']) ?? 0));
  }

  double get totalConvenienceFee {
    return _wishlist.fold(
        0,
        (sum, item) =>
            sum + (double.tryParse(item['convenienceFee'] ?? '0') ?? 0));
  }
}
