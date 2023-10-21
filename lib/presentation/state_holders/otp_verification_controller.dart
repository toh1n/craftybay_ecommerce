import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/user_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  String _message = '';

  UserModel _userModel = UserModel();

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  String get message => _message;

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
}