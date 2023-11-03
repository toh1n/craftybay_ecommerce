import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  Future<void> goToNextScreen() async {
    await AuthController.getAccessToken();

    Future.delayed(const Duration(seconds: 2)).then((value) async {

      if(AuthController.isLoggedIn ) {
        final NetworkResponse readProfile = await NetworkCaller.getRequest(Urls.readProfile);

        if(readProfile.responseJson!['data'] == null || readProfile.responseJson!['data'] == ''){
          Get.offAll(() => const CompleteProfileScreen());
        }
        else{
          Get.offAll(() => const MainBottomNavScreen());
        }
      } else{
        Get.offAll(() => const EmailVerificationScreen());
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(
            ImageAssets.craftyBayLogoSVG,
            width: 100,
          )),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 16,
          ),
          const Text('Version 1.0.0'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
