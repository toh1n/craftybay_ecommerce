
import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/user_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  String _message = '';
  UserModel _readProfileModel = UserModel();

  String get message => _message;

  UserModel get readProfileModel => _readProfileModel;

  Future<bool> readProfileData() async {
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.readProfile);
    if (response.isSuccess) {
      _readProfileModel =
          UserModel.fromJson(response.responseJson ?? {});
      return true;
    } else {
      _message = 'Read profile data fetch failed!';
      return false;
    }
  }
}
