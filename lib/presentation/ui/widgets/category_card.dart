import 'package:craftybay_ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  const CategoryCard({
    super.key, required this.icon, required this.onTap, required this.categoryName,
  });
  final IconData icon;
  final VoidCallback onTap;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              child:  Icon(
                icon,
                size: 32,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
             Text(
              categoryName,
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.primaryColor,
                  letterSpacing: 0.4),
            )
          ],
        ),
      ),
    );
  }
}