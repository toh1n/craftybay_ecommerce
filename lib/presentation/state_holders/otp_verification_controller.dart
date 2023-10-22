import 'dart:async';

import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/user_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  String _message = '';

  late Timer timer;
  int start = 20;
  bool canResend = false;

  UserModel _userModel = UserModel();

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

  Future<int> verifyOtp(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationInProgress = false;
    update();
    if (response.isSuccess) {
      await AuthController.setAccessToken(response.responseJson?['data']);

      final NetworkResponse readProfile = await NetworkCaller.getRequest(Urls.readProfile);

      _userModel = UserModel.fromJson(readProfile.responseJson ?? {});

      if(readProfile.responseJson!['data'] == null || readProfile.responseJson!['data'] == ''){
        return -1;
      } else{
        return 1;
      }
    } else {
      return 0;
    }
  }


  Future<bool> resendOTP(String email) async {
    startTimer();
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