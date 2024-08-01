import 'package:ecommerce_app/views/screens/categories/gridtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchView extends StatelessWidget {
  final List<StaggeredTile> _cardTile = <StaggeredTile>[
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 4),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 4),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 4),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 4),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 4),
    StaggeredTile.count(2, 3),
  ];

  final List<Widget> _listTile = <Widget>[
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2022/10/28/02/20/night-7552210_640.jpg',
      height: 190,
      title: 'Black Winter Hoodie',
      description: 'Autumn and winter Cotton-padded Jacket',
      price: '\$499',
      rating: 4.5,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2015/12/31/08/01/honor-1115325_640.jpg',
      height: 290,
      title: 'Mens Shirt',
      description: 'Men Starry shirt Comfortable and elegant to wear.',
      price: '\$250',
      rating: 4.0,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2017/06/20/22/57/women-2425268_1280.jpg',
      height: 190,
      title: 'Womens Maxi',
      description: 'Embroided Silk Maxi for All seasons',
      price: '\$320',
      rating: 4.2,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2020/02/01/03/00/girl-4809433_640.jpg',
      height: 290,
      title: 'Womens Kurti ',
      description: 'Floral Cotton  Embroided Kurti',
      price: '\$180',
      rating: 4.8,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2022/12/04/07/03/woman-7633843_640.jpg',
      height: 190,
      title: 'Embroided Dress',
      description: 'Aqua Blue & Earthen Embroided Stitch Dress',
      price: '\$500',
      rating: 4.9,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2021/03/15/17/40/ladies-dress-wear-6097570_1280.jpg',
      height: 290,
      title: 'Khaadi Summer Lawn',
      description: 'Embroided Stitch Lawn By Khaadi',
      price: '\$490',
      rating: 4.3,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2020/07/19/05/31/nike-5418992_640.jpg',
      height: 190,
      title: 'Jordans',
      description: 'The Classic Air Jordans Comfartable to wear',
      price: '\$110',
      rating: 4.6,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2019/11/23/11/33/mobile-phone-4646854_1280.jpg',
      height: 290,
      title: 'Realmi 7',
      description: '6 GB RAM 64 GB ROM Which is expandable to 256 GB',
      price: '\$530',
      rating: 4.7,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2015/01/29/17/02/camera-616396_640.jpg',
      height: 190,
      title: 'Sony Camera',
      description: 'Capture your moments with our Sony xperon',
      price: '\$180',
      rating: 4.4,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2017/08/02/18/45/clothing-2572851_640.jpg',
      height: 290,
      title: 'Trench Coat',
      description: 'Long Rain Coat For Winter to keep you Warm  ',
      price: '\$370',
      rating: 4.1,
    ),
    ProductTile(
      image:
          'https://cdn.pixabay.com/photo/2021/03/08/12/31/oxford-shoes-6078993_1280.jpg',
      height: 190,
      title: 'Mens Shoes',
      description: ' George Walker by Deorby Brown Formal Shoes',
      price: '\$470',
      rating: 4.6,
    ),
  ];

  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Center(
          child: Image.network(
            'https://cdn.pixabay.com/photo/2023/03/06/13/58/logo-7833520_1280.png',
            height: 40,
            width: 300,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/01/27/04/53/muslim-7747745_640.png',
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic_none),
                    onPressed: () {},
                  ),
                  hintText: 'Search any Products',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '52,820+ Items',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.sort),
                          label: const Text('Sort'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            elevation: 0,
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_alt),
                          label: const Text('Filter'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(_listTile.length, (index) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: _cardTile[index].crossAxisCellCount,
                    mainAxisCellCount: _cardTile[index].mainAxisCellCount,
                    child: _listTile[index],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StaggeredTile {
  final int crossAxisCellCount;
  final int mainAxisCellCount;

  StaggeredTile(this.crossAxisCellCount, this.mainAxisCellCount);

  factory StaggeredTile.count(int crossAxisCellCount, int mainAxisCellCount) {
    return StaggeredTile(crossAxisCellCount, mainAxisCellCount);
  }
}
