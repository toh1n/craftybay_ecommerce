import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/utility/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/url_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  bool _emailVerificationInProgress = false;
  String _message = '';

  bool get emailVerificationInProgress => _emailVerificationInProgress;

  String get message => _message;

  Future<bool> verifyEmail(String email) async {
    _emailVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.verifyEmail(email));
    _emailVerificationInProgress = false;
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