import 'dart:async';

import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/utility/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/url_manager.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController{
  late Timer timer;
  int start = 120;
  bool canResend = true;



  bool _otpVerificationInProgress = false;
  String _message = '';

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  String get message => _message;

  void startTimer() {
    canResend = false;
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) {
        if (start == 0) {
          timer.cancel();
          canResend = true;
          start = 120;
          update();
        } else {
          start--;
          update();
        }
      },
    );
  }

  Future<bool> verifyOtp(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationInProgress = false;
    update();
    if (response.isSuccess) {
      await AuthController.setAccessToken(response.responseJson?['data']);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resendOTP(String email) async {
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.verifyEmail(email));
    update();
    if (response.isSuccess) {
      _message = response.responseJson?['data'] ?? '';
      Fluttertoast.showToast(msg: _message);
      return true;
    } else {
      _message = 'Email verification failed! Try again';
      Fluttertoast.showToast(msg: _message);
      return false;
    }
  }
}
