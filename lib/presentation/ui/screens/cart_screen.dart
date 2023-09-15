import 'package:craftybay_ecommerce/presentation/state_holders/base_nav_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Get.find<BaseNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          ),
          leadingWidth: 25,
        ),
        body: const Center(
          child: Text("Cart Screen"),
        ),
      ),
    );
  }
}
