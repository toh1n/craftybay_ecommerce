import 'package:craftybay_ecommerce/data/models/category_model.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/category_list_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/image_manager.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/circular_icon_button.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/home/home_slider.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/home/section_header.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List <CategoryModel> categoryData = [
    CategoryModel(Icons.desktop_windows, "Electronics", () {}),
    CategoryModel(Icons.fastfood, "Food", () {}),
    CategoryModel(Icons.local_grocery_store_rounded, "Grocery", () {}),
    CategoryModel(Icons.diamond_outlined, "Fashion", () {}),
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
            false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 0,
          title: Row(
            children: [
              SvgPicture.asset(
                ImageManager.craftyBayNavLogoSVG,
              ),
              const Spacer(),
              CircularIconButton(
                icon: Icons.person,
                onTap: () {},
              ),
              const SizedBox(
                width: 8,
              ),
              CircularIconButton(
                icon: Icons.call,
                onTap: () {},
              ),
              const SizedBox(
                width: 8,
              ),
              CircularIconButton(
                icon: Icons.notifications_none,
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const HomeSlider(),
                SectionHeader(
                  title: 'Categories',
                  onTap: () {
                    Get.to(const CategoryListScreen());
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                      itemCount: categoryData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return  CategoryCard(icon: categoryData[index].iconData,categoryName: categoryData[index].categoryName,onTap: categoryData[index].onTap,);
                      }),
                ),
                const SizedBox(
                  height: 16,
                ),
                SectionHeader(
                  title: 'Popular',
                  onTap: () {},
                ),
                SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SectionHeader(
                  title: 'Special',
                  onTap: () {},
                ),
                SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SectionHeader(
                  title: 'New',
                  onTap: () {},
                ),
                SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}