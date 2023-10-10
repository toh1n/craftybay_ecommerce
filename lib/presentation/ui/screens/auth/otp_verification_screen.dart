import 'package:craftybay_ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/base_nav_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;
  const OTPVerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  OtpVerificationController controller = Get.put(OtpVerificationController());

  final TextEditingController _otpTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter your OTP code',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('A 4 digit OTP code has been sent',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor,
                    selectedColor: Colors.green,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<OtpVerificationController>(
                      builder: (controller) {
                        if (controller.otpVerificationInProgress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () {
                            verifyOtp(controller);
                          },
                          child: const Text('Next'),
                        );
                      }
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),
                GetBuilder<OtpVerificationController>(
                  builder: (controller){
                    return RichText(
                      text:  TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(text: 'This code will expire in '),
                          TextSpan(
                            text: '${controller.start}s',
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                GetBuilder<OtpVerificationController>(
                  builder: (controller){
                    return TextButton(
                      onPressed: controller.canResend ? (){
                        controller.resendOTP(widget.email);
                        controller.startTimer();
                      } : (){},
                      style: controller.canResend ? TextButton.styleFrom(foregroundColor: Colors.blue) :TextButton.styleFrom(foregroundColor: Colors.grey),
                      child: const Text('Resend'),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response =
    await controller.verifyOtp(widget.email, _otpTEController.text.trim());
    if (response) {
      Get.offAll(() => const BaseNavScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Otp verification failed! Try again'),
          ),
        );
      }
    }
  }
}