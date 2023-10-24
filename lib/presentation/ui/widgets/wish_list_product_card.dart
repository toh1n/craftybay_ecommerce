import 'package:craftybay_ecommerce/data/models/wish_list_model.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/wish_list_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/product_details_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListProductCard extends StatelessWidget {
  final WishListProduct wishListProduct;
  const WishListProductCard({
    super.key, required this.wishListProduct,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(productId: wishListProduct.id!));
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(wishListProduct.image ?? ''))),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wishListProduct.title ?? '',
                                style:
                                const TextStyle(fontSize: 18, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.find<WishListController>().removeFromWishList(wishListProduct.id!);
                            },
                            icon: const Icon(Icons.delete_outline))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${wishListProduct.price ?? ''}',
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
