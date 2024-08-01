import 'package:ecommerce_app/views/screens/categories/itemcard.dart';
import 'package:ecommerce_app/views/screens/categories/productlist.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final List<Productlist> productsitems = [
    Productlist(
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/01/29/17/02/camera-616396_640.jpg',
      title: 'Sony Camera',
      price: '₹1800',
      originalPrice: '₹2500',
      discount: '40% Off',
      rating: '4.5',
      reviews: '56890',
    ),
    Productlist(
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/08/02/18/45/clothing-2572851_640.jpg',
      title: 'Trench Coat',
      price: '₹370',
      originalPrice: '₹499',
      discount: '19% Off',
      rating: '4.6',
      reviews: '344567',
    ),
    Productlist(
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/03/08/12/31/oxford-shoes-6078993_1280.jpg',
      title: 'Mens Shoes',
      price: '₹3500',
      originalPrice: '₹5000',
      discount: '30% Off',
      rating: '4.7',
      reviews: '1245',
    ),
  ];

  final List<Product> products = [
    Product(
      imageUrl:
          'https://cdn.pixabay.com/photo/2022/10/28/02/20/night-7552210_640.jpg',
      name: 'Black Winter Hoodie',
      subtitle: 'Stay warm this winter',
      price: 499,
      originalPrice: 859,
      discount: 60,
      rating: '4.5',
      reviews: '56890',
    ),
    Product(
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/07/19/05/31/nike-5418992_640.jpg',
      name: 'Jordans',
      subtitle: 'he classic Air Jordans',
      price: 100,
      originalPrice: 120,
      discount: 20,
      rating: '4.6',
      reviews: '344567',
    ),
    Product(
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/11/23/11/33/mobile-phone-4646854_1280.jpg',
      name: 'Realmi 7',
      subtitle: 'Featuring 6 GB RAM and 64 GB ROM',
      price: 3500,
      originalPrice: 5000,
      discount: 30,
      rating: '4.7',
      reviews: '1245',
    ),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _buildSponsoredd(),
            const SizedBox(height: 10),
            _buildDealOfTheDay(),
            const SizedBox(height: 10),
            _buildGrid(products),
            const SizedBox(height: 25),
            _buildSpecialOffers(),
            const SizedBox(height: 20),
            _buildshoes(),
            const SizedBox(height: 16),
            _buildTrendingProducts(),
            const SizedBox(height: 12),
            _buildGrid(productsitems
                .map((item) => Product(
                      imageUrl: item.imageUrl,
                      name: item.title,
                      subtitle: '',
                      price: int.parse(item.price.replaceAll('₹', '')),
                      originalPrice:
                          int.parse(item.originalPrice.replaceAll('₹', '')),
                      discount:
                          int.parse(item.discount.replaceAll('% Off', '')),
                      rating: item.rating,
                      reviews: item.reviews,
                    ))
                .toList()),
            _buildNewArrivals(),
            const SizedBox(height: 10),
            _buildSponsored(),
            const SizedBox(height: 10),
            _buildFlatAndHeels(),
          ],
        ),
      ),
    );
  }

  Widget _buildDealOfTheDay() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deal of the Day',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '22h 55m 20s remaining',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text('View all'),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(List<Product> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }

  Widget _buildSpecialOffers() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[50],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://cdn.pixabay.com/photo/2016/05/29/01/17/special-offer-1422378_1280.png',
            height: 90,
            width: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special Offers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'We make sure you get the best offer available.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildshoes() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red[200],
        boxShadow: [
          const BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://cdn.pixabay.com/photo/2021/03/08/12/31/oxford-shoes-6078993_1280.jpg',
            height: 300,
            width: 300,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Mens Shoes',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'George Walker by Deorby brown formal shoes, ideal for any formal occasion.',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Visit Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlatAndHeels() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: [
          const BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://cdn.pixabay.com/photo/2020/02/01/03/00/girl-4809433_640.jpg',
            height: 300,
            width: 300,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Womens Kurti',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Floral cotton embroided kurti that brings a refreshing touch to your wardrobe.',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Visit Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingProducts() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending Products',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Here is the list of all the treading products...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.white, size: 18),
                    SizedBox(width: 5),
                    Text(
                      'Last Date 6/08/24',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.white, width: 1.5),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewArrivals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'New Arrivals',
          actionText: 'View all',
          actionOnTap: () {},
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Image.network(
              'https://cdn.pixabay.com/photo/2017/01/28/19/06/label-2016248_1280.png',
              height: 200, // specify your desired height
              width: 200, // specify your desired width
              fit: BoxFit.cover, // to make sure the image covers the area
            ),
            const Text(
              'Summer \n \'25 Collections',
              style: TextStyle(
                color: Colors.red, // Set color to white for better visibility
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSponsored() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sponsored',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2017/07/25/14/50/shoes-2538424_1280.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Up to 50% Off',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSponsoredd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sponsored',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2020/03/06/19/33/brush-4908005_1280.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Up to 30% Off',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String actionText,
    required VoidCallback actionOnTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: actionOnTap,
          child: Text(actionText),
        ),
      ],
    );
  }
}
