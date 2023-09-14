import 'package:craftybay_ecommerce/data/models/category_model.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {

  List <CategoryModel> categoryData = [
    CategoryModel(Icons.desktop_windows, "Electronics", () {}),
    CategoryModel(Icons.fastfood, "Food", () {}),
    CategoryModel(Icons.local_grocery_store_rounded, "Grocery", () {}),
    CategoryModel(Icons.diamond_outlined, "Fashion", () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
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
            itemCount: categoryData.length,
            itemBuilder: (context, index) {
              return FittedBox(
                child: CategoryCard(icon: categoryData[index].iconData,categoryName: categoryData[index].categoryName,onTap: categoryData[index].onTap,),
              );
            }),
      ),
    );
  }
}