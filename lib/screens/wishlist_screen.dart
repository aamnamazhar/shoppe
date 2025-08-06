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
        iconTheme: const IconThemeData(color: Colors.black87),
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wishlist',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Recently viewed',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
              itemCount: 6,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/user${index + 1}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),


          const SizedBox(height: 10),

          // Wishlist Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
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
