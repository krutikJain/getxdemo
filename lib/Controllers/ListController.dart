import 'package:get/get.dart';

class ListController extends GetxController{

  RxList list = [].obs;

  RxList fav = [].obs;

  addList(String val){
    list.add(val);
  }
  addFav(int index){
    fav.add(index);
  }
  removeList(int index){
    fav.remove(index);
  }

}