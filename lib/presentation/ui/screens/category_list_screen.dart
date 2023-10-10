import 'package:craftybay_ecommerce/data/models/category_model.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/base_nav_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {

  // List <CategoryModel> categoryData = [
  //   CategoryModel(Icons.desktop_windows, "Electronics", () {}),
  //   CategoryModel(Icons.fastfood, "Food", () {}),
  //   CategoryModel(Icons.local_grocery_store_rounded, "Grocery", () {}),
  //   CategoryModel(Icons.diamond_outlined, "Fashion", () {}),
  // ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<BaseNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Categories',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          leadingWidth: 25,
          leading: IconButton(
            onPressed: (){
              Get.find<BaseNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return FittedBox();
              }),
        ),
      ),
    );
  }
}