import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_project_flutter/database/DatabaseHelper.dart';

class LoginController extends GetxController {
  RxBool hidePassword = true.obs;
  final passwordTextController = TextEditingController();

}