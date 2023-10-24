import 'package:craftybay_ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/wish_list_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/wish_list_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WishListController>().getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Wishlist',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,

          ),
        ),
        body: GetBuilder<WishListController>(
          builder: (controller) {
            if(controller.getNewProductsInProgress)
              {
                return const Center(child: CircularProgressIndicator(),);
              }
            if(controller.wishListModel.data!.isNotEmpty)
              {
                return ListView.builder(

                    itemCount: controller.wishListModel.data!.length,

                    itemBuilder: (context, index) {
                      return WishListProductCard(wishListProduct: controller.wishListModel.data![index].product!);
                    });
              }
            else {
              return const Center(child: Text("Empty List"),);
            }

          }
        ),
      ),
    );
  }
}
