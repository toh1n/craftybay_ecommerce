
import 'package:get/get.dart';

class BaseNavController extends GetxController{
  int selectedIndex = 0;

  void changeScreen(int index) {
    selectedIndex = index;
    update();
  }
  void backToHome(){
    changeScreen(0);
  }
}