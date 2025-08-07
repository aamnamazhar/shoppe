import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../screens/home_screen.dart';
import '../screens/wishlist_screen.dart';
import '../screens/items_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  void _onTabTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WishlistScreen()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ItemsScreen()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CartScreen()));
        break;
      case 4:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) => _onTabTapped(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.heart), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.list), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.shoppingBag), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profile'),
      ],
    );
  }
}
