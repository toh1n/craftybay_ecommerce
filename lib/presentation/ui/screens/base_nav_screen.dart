import 'package:craftybay_ecommerce/presentation/state_holders/base_nav_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/cart_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/category_list_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/wish_list_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BaseNavScreen extends StatefulWidget {
  const BaseNavScreen({super.key});

  @override
  State<BaseNavScreen> createState() => _BaseNavScreenState();
}

class _BaseNavScreenState extends State<BaseNavScreen> {

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: controller.changeScreen,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            elevation: 4,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled,), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard,), label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border,), label: 'Wishlist'),
            ],
          ),
        );
      }
    );
  }
}