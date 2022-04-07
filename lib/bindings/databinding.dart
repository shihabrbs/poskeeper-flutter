import 'package:get/get.dart';
import 'package:getx_project_flutter/Controller/datacontroller.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DataController());
  }

}