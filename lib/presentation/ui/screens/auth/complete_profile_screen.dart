import 'package:craftybay_ecommerce/presentation/state_holders/complete_profile_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/validation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final TextEditingController _postalCodeTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
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
                    'Complete Profile',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Get started with us by share your details',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'First name'),
                    controller: _firstNameTEController,
                    validator: (value) => ValidationManager.validateName(value),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Last name'),
                    controller: _lastNameTEController,
                    validator: (value) => ValidationManager.validateName(value),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Mobile'),
                    keyboardType: TextInputType.phone,
                    controller: _mobileTEController,
                    validator: (value) =>
                        ValidationManager.validateBangladeshiPhoneNumber(value),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: 'City'),
                          controller: _cityTEController,
                          validator: (value) =>
                              ValidationManager.validateCity(value),
                        ),
                      ),
                      const SizedBox(
                          width:
                              10), // Add spacing between City and Postal Code
                      Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Postal Code'),
                          controller: _postalCodeTEController,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              ValidationManager.validatePostalCode(value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Shipping address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    controller: _shippingAddressTEController,
                    validator: (value) =>
                        ValidationManager.validateAddress(value),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CompleteProfileController>(
                        builder: (controller) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.completeProfile(
                                _firstNameTEController.text.trim(),
                                _lastNameTEController.text.trim(),
                                _mobileTEController.text.trim(),
                                _cityTEController.text.trim(),
                                _postalCodeTEController.text.trim(),
                                _shippingAddressTEController.text.trim()
                            ).then((value) => {
                                if(value){
                            Fluttertoast.showToast(msg: "Profile completed successfully"),
                                Get.offAll(() => const MainBottomNavScreen()),
                              } else{
                                Fluttertoast.showToast(msg: "Profile completion failed"),
                              }
                            });
                          }
                        },
                        child: const Text('Complete'),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
