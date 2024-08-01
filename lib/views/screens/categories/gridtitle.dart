import 'package:ecommerce_app/views/navigation.dart/detail.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final double rating;
  final double height;

  ProductTile({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.height,
  });

  final List<String> detailDescriptions = [
    'Sherpa fleece lined hoodies for men, our mens hoodie is made with warm and comfortable fleece sherpa polyester and cotton. Fuzzy fluffy sherpa fleece lining, added warmth and comfort, helps block out the cold',
    'Made of soft, lightweight eyelash lace fabric for comfort and breathability Features a deep V-neckline, sheer short sleeves, high waist, and full-length A-line skirt',
    'Rayon Embroidery Kurti Palazzo Set with New Broad Border Cotton Dupatta The set includes comfortable and stylish bottoms that are designed for comfort and fashion. They enable you to move freely while maintaining a sophisticated appearance',
    'You can wear this women casual dress at home, at work or at party, also it is suitable for casual shopping or walk. Occasion: Traditional wear, Casual Wear, Party wear, Evening wear, Family Functions, Work.',
    'Unlocked Android 5G phone gives you the flexibility to change carriers and choose your own data plan[2]; works with Google Fi, Verizon, T-Mobile, AT&T, and other major carriers Pixel’s Adaptive Battery can last over 24 hours when Extreme Battery Saver is turned on, it can last up to 72 hours[3]',
    'Advanced 24.2MP BSI Full-frame Image Sensor w/ 1.8X readout speed Advanced 24.2MP Back-Illuminated 35mm Full-frame Image Sensor 15-stop dynamic range, 14-bit uncompressed RAW, ISO 50 to 204,800',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              image: image,
              title: title,
              price: price,
              rating: rating,
              description: description,
              detailDescriptions: detailDescriptions,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          color: Colors.grey[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: height,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        description,
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Price: $price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.red, size: 16.0),
                          Icon(Icons.star, color: Colors.red, size: 16.0),
                          Icon(Icons.star, color: Colors.red, size: 16.0),
                          Icon(Icons.star, color: Colors.red, size: 16.0),
                          SizedBox(width: 4.0),
                          Text(
                            '$rating',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
