import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/review_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController{

  ReviewModel _review = ReviewModel();

  bool _getReviewInProgress = false;

  ReviewModel get review => _review;

  bool get getReviewInProgress => _getReviewInProgress;

  Future<bool> getReview(int productId) async {
    _getReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.reviewFromId(productId));
    _getReviewInProgress = false;
    if (response.isSuccess) {
      _review = ReviewModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Fetch product details has been failed! Try again.');
      update();
      return false;
    }
  }

  Future<bool> setReview(int productId, Map<String,dynamic> body ) async {

    _getReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.setReview,body);
    _getReviewInProgress = false;
    if (response.responseJson!['msg'] == 'success') {
      update();
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Failed to add review! Try again.');
      update();
      return false;
    }
  }



}
