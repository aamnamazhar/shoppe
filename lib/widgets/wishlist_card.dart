import 'package:flutter/material.dart';

class WishlistItem extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final double? oldPrice;
  final String color;
  final String size;

  const WishlistItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: 6),

                  // Prices
                  Row(
                    children: [
                      if (oldPrice != null)
                        Text(
                          '\$${oldPrice!.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 13,
                          ),
                        ),
                      const SizedBox(width: 6),
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Dropdowns
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: color,
                        isDense: true,
                        underline: SizedBox(),
                        iconSize: 20,
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                        items: ['Pink', 'Red', 'Blue']
                            .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                            .toList(),
                        onChanged: (_) {},
                      ),
                      const SizedBox(width: 12),

                      // Size Dropdown
                      DropdownButton<String>(
                        value: size,
                        isDense: true,
                        underline: SizedBox(),
                        iconSize: 20,
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                        items: ['S', 'M', 'L']
                            .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                            .toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp, color: Colors.blue),
              onPressed: () {},
              tooltip: "Add to Cart",
            ),
          ],
        ),
      ),
    );
  }
}
