import 'package:craftybay_ecommerce/presentation/state_holders/base_nav_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/special_product_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseNavController());
    Get.put(EmailVerificationController());
    Get.put(HomeSlidersController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(NewProductController());
    Get.put(SpecialProductController());
  }
}

