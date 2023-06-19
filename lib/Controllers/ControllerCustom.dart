
import 'package:get/get.dart';

class ControllerCustom extends GetxController{

  RxInt count = 0.obs;

  Increment(){
    count.value++;
  }
}