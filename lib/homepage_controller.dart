import 'package:get/get.dart';

class HomepageControlelr extends GetxController {
  RxInt value = 0.obs; //Getx Variable declaration

  void increment() {
    //function Outside widget
    value.value = value.value + 1;
  }
}
