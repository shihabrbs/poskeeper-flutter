import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CounterController extends GetxController{
  static CounterController get to => Get.find();
final count = 0.obs;
//int count = 0;
void increment(){
  count.value++;
  //for Simple state Management
/*  count++;
  update(['count1',count<10]);*/

}

@override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debugPrint("Controller OnReady been Called");
  }
  @override
  void onClose() {
    // TODO: implement onClose
    debugPrint("Controller onClose been Called");
    super.onClose();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    debugPrint("Controller onInit been Called");

    //Called Every time 'count' Changes.
    ever(count,(_)=>debugPrint("$_ has been change"));
  }

}