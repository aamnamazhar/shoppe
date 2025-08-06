import 'package:flutter/material.dart';
import 'package:shoppe/widgets/custom_bottom_nav_bar.dart';
import 'package:shoppe/widgets/wishlist_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Wishlist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Recently Viewed
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/user${index + 1}.jpg'),
                ),
              ),
            ),
          ),

          // Wishlist Items
          Expanded(
            child: ListView(
              children: [
                WishlistItem(
                  image: 'assets/1.jpg',
                  title: 'Lorem ipsum dolor sit amet consectetur.',
                  price: 17.00,
                  color: 'Pink',
                  size: 'M',
                ),
                WishlistItem(
                  image: 'assets/2.jpg',
                  title: 'Lorem ipsum dolor sit amet consectetur.',
                  price: 12.00,
                  oldPrice: 17.00,
                  color: 'Pink',
                  size: 'M',
                ),
                WishlistItem(
                  image: 'assets/3.jpg',
                  title: 'Lorem ipsum dolor sit amet consectetur.',
                  price: 27.00,
                  color: 'Pink',
                  size: 'M',
                ),
                WishlistItem(
                  image: 'assets/4.jpg',
                  title: 'Lorem ipsum dolor sit amet consectetur.',
                  price: 19.00,
                  color: 'Pink',
                  size: 'M',
                ),
              ],
            ),
          ),
        ],
      ),
     bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}

