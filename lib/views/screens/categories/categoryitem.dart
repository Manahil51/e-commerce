import 'package:ecommerce_app/views/screens/categories/itemcard.dart';
import 'package:ecommerce_app/views/screens/categories/productlist.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final List<Productlist> productsitems = [
    Productlist(
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/06/11/14/34/indian-clothing-366716_640.jpg',
      title: 'Women Printed Kurta',
      price: '₹1500',
      originalPrice: '₹2500',
      discount: '40% Off',
      rating: '4.5',
      reviews: '56890',
    ),
    Productlist(
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/11/14/19/57/sneakers-531172_1280.jpg',
      title: 'HRX by Hrithik Roshan',
      price: '₹2499',
      originalPrice: '₹4999',
      discount: '50% Off',
      rating: '4.6',
      reviews: '344567',
    ),
    Productlist(
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/08/05/15/04/leather-2584298_1280.jpg',
      title: 'Leather Jacket',
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
          'https://cdn.pixabay.com/photo/2017/03/20/15/13/wrist-watch-2159351_640.jpg',
      name: 'IWC Schaffhausen 2021 Pilot\'s Watch',
      subtitle: 'SIHH 2019 44mm',
      price: 650,
      originalPrice: 1599,
      discount: 60,
      rating: '4.5',
      reviews: '56890',
    ),
    Product(
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/09/17/06/25/adidas-5578112_640.jpg',
      name: 'Labbin White Sneakers',
      subtitle: 'For Men and Women',
      price: 650,
      originalPrice: 1250,
      discount: 70,
      rating: '4.6',
      reviews: '344567',
    ),
    Product(
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/08/20/11/39/handbag-2661412_1280.jpg',
      name: 'Hand Bag',
      subtitle: 'For Female',
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
            const SizedBox(height: 10),
            _buildBannerSection(),
            const SizedBox(height: 10),
            _buildDealOfTheDay(),
            const SizedBox(height: 10),
            _buildGrid(products),
            const SizedBox(height: 25),
            _buildSpecialOffers(),
            const SizedBox(height: 20),
            _buildFlatAndHeels(),
            const SizedBox(height: 10),
            _buildTrendingProducts(),
            const SizedBox(height: 16),
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
            const SizedBox(height: 10),
            _buildNewArrivals(),
            const SizedBox(height: 10),
            _buildSponsored(),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerSection() {
    return Container(
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/Shopping.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '50-40% off',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Now in (product) all colors',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Shop Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDealOfTheDay() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
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
          Image.asset(
            'assets/offer.png',
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

  Widget _buildFlatAndHeels() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        boxShadow: const [
          BoxShadow(
            color: Colors.yellow,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/High Heels.png',
            height: 100,
            width: 200,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Flat and Heels',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Stand a chance to get rewarded',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],
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
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.white, size: 18),
                    SizedBox(width: 5),
                    Text(
                      'Last Date 27/06/24',
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
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/Summersale.png'),
              fit: BoxFit.cover,
            ),
          ),
          height: 150,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Summer \'25 Collections',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
              image: AssetImage('assets/sponsered.png'),
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
