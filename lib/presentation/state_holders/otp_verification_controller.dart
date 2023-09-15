import 'dart:async';

import 'package:get/get.dart';

class OtpVerificationController extends GetxController{
  late Timer timer;
  int start = 120;
  bool canResend = true;

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
}