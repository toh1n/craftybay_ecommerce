import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _isLoading = false;
  String _message = '';
  String get message => _message;

  bool get isLoading => _isLoading;

  Future<bool> completeProfile(String firstName, String lastName, String mobile,
      String city,String postCode, String shippingAddress) async {
    _isLoading = true;
    Map<String,dynamic> body = {
      "cus_name": "$firstName $lastName",
      "cus_add": shippingAddress,
      "cus_city": city,
      "cus_state": city,
      "cus_postcode": postCode,
      "cus_country": "Bangladesh",
      "cus_phone": mobile,
      "cus_fax": mobile,
      "ship_name": "$firstName $lastName",
      "ship_add": shippingAddress,
      "ship_city": city,
      "ship_state": city,
      "ship_postcode": postCode,
      "ship_country": "Bangladesh",
      "ship_phone": mobile
    };

    final NetworkResponse response = await NetworkCaller.postRequest(Urls.completeProfile,body);

    _isLoading = false;
    update();
    if (response.isSuccess) {
      _message = response.responseJson?['msg'] ?? '';
      if(_message == 'success')
        {
          return true;
        }
      return false;
    } else {
      return false;
    }
  }
}
