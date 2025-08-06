import 'package:flutter/material.dart';
import 'package:shoppe/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Shop',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Clothing", style: TextStyle(color: Colors.blue.shade700)),
                            SizedBox(width: 4),
                            Icon(Icons.close, size: 16, color: Colors.blue.shade700),
                          ],
                        ),
                        Icon(Icons.camera_alt_outlined, size: 20, color: Colors.blue.shade700),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Categories
              GridView.count(
                crossAxisCount: 5,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ProductCategories(label: "Dresses", imagePath: "assets/dresses.jpg"),
                  ProductCategories(label: "Pants", imagePath: "assets/pants.jpg"),
                  ProductCategories(label: "Skirts", imagePath: "assets/skirts.jpg"),
                  ProductCategories(label: "Shorts", imagePath: "assets/shorts.jpg"),
                  ProductCategories(label: "Jackets", imagePath: "assets/jackets.jpg"),
                  ProductCategories(label: "Hoodies", imagePath: "assets/hoodies.jpg"),
                  ProductCategories(label: "Shirts", imagePath: "assets/shirts.jpg"),
                  ProductCategories(label: "Polo", imagePath: "assets/polo.jpg"),
                  ProductCategories(label: "T-Shirts", imagePath: "assets/tshirts.jpg"),
                  ProductCategories(label: "Tunics", imagePath: "assets/tunics.jpg"),
                ],
              ),

              const SizedBox(height: 20),

              // All Items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'All Items',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.tune),
                ],
              ),
              const SizedBox(height: 16),
              
              // Products
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.72,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ProductCard(imagePath: 'assets/1.jpg', title: 'Stylish Shades', price: 17.00),
                  ProductCard(imagePath: 'assets/2.jpg', title: 'Trendy White Top', price: 17.00),
                  ProductCard(imagePath: 'assets/3.jpg', title: 'Fancy Hat Wear', price: 17.00),
                  ProductCard(imagePath: 'assets/4.jpg', title: 'Colorful Shopping', price: 17.00),
                  ProductCard(imagePath: 'assets/5.jpg', title: 'Trendy Look', price: 17.00),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}

// Product Categories
class ProductCategories extends StatelessWidget {
  final String label;
  final String imagePath;

  const ProductCategories({
    super.key,
    required this.label,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue.shade100, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}


// Product Cards
class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double price;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF222222),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
