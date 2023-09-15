import 'package:craftybay_ecommerce/presentation/state_holders/base_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

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
            'Wish List',
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
        body: const Center(
          child: Text("Wish List Screen"),
        ),
      ),
    );
  }
}
