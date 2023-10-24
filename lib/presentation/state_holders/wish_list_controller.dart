import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/wish_list_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{

  bool _getNewProductsInProgress = false;
  WishListModel _wishListModel = WishListModel();
  String _errorMessage = '';

  bool get getNewProductsInProgress => _getNewProductsInProgress;

  WishListModel get wishListModel => _wishListModel;

  String get errorMessage => _errorMessage;

  Future<bool> getWishList() async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.getWishList);
    _getNewProductsInProgress = false;
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'New product fetch failed! Try again.';
      update();
      return false;
    }
  }

  Future<void> addToWishList(int id) async {

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.addToWishList(id));

    if(response.responseJson!['msg'] == "success") {
      Fluttertoast.showToast(msg: "Added to wish List");
    } else {
      Fluttertoast.showToast(msg: "Failed to add to wish List");
    }
  }

  Future<void> removeFromWishList(int id) async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.removeFromWishList(id));
    _getNewProductsInProgress = false;
    update();
    if(response.responseJson!['msg'] == "success") {
      _wishListModel.data?.removeWhere((element) => element.productId == id);
      update();
      Fluttertoast.showToast(msg: "Removed from wish List");
    } else {
      Fluttertoast.showToast(msg: "Failed to remove from wish List");
    }
  }
}