import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shoppe/widgets/wishlist_card.dart';
import 'package:shoppe/widgets/custom_bottom_nav_bar.dart';
import 'package:shoppe/screens/orders_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Text(
              'Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '2',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Shipping Address
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh City',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      LucideIcons.edit,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Cart Items
              CartItemTile(
                imageUrl: 'assets/user1.jpg',
                title: 'Oversized Hoodie',
                size: 'M',
                color: 'Pink',
                price: 17.00,
                quantity: 1,
              ),
              CartItemTile(
                imageUrl: 'assets/pants.jpg',
                title: 'Slim Fit T-shirt',
                size: 'L',
                color: 'Black',
                price: 24.50,
                quantity: 2,
              ),

              SizedBox(height: 20),

              // Wishlist Title
              Text(
                "From Your Wishlist",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              // Wishlist Items
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
      ),

        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: \$34.00",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const OrdersScreen()));
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      elevation: 0,
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            const CustomBottomNavBar(currentIndex: 3),
          ],
        ),
    );
  }
}

//card items
class CartItemTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String size;
  final String color;
  final double price;
  final int quantity;

  const CartItemTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.color,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$color, Size $size',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.remove_circle_outline, size: 22, color: Colors.blue),
                          const SizedBox(width: 6),
                          Text(quantity.toString(), style: const TextStyle(fontSize: 14)),
                          const SizedBox(width: 6),
                          Icon(Icons.add_circle_outline, size: 22, color: Colors.blue),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
