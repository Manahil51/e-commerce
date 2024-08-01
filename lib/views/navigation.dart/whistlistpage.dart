import 'package:ecommerce_app/common/checkoutpagel.dart';
import 'package:ecommerce_app/viewmodel/whiltistmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ViewModelBuilder<WishlistViewModel>.reactive(
        viewModelBuilder: () => WishlistViewModel(),
        builder: (context, model, child) => ListView.builder(
          itemCount: model.wishlist.length,
          itemBuilder: (context, index) {
            final item = model.wishlist[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(item: item),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Image.network(
                    item['image'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item['title'] ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['description'] ?? ''),
                      Text('Price: ${item['price'] ?? ''}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      model.removeFromWishlist(index);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
