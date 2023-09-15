import 'package:craftybay_ecommerce/presentation/state_holders/base_nav_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseNavController());
    Get.put(OtpVerificationController());
  }
}