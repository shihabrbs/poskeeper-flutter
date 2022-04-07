import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get.dart';
import 'package:getx_project_flutter/model/login_response.dart';
import 'package:getx_project_flutter/provider/api_provider.dart';
import 'package:getx_project_flutter/provider/provider.dart';
import 'package:getx_project_flutter/routes/app_routes.dart';

class DataController extends GetxController with StateMixin<List<dynamic>>{
  static DataController get to => Get.find();

      // ignore: deprecated_member_use
      var datalist = <LoginResponse>[].obs;

RxString myotp = "".obs;
  @override
  void onInit() {
    super.onInit();

    Provider().getUser().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });


  }




  void checkLogin(String phone) async {
    await ApiProvider().login(phone).then((values) {
      if (values != null) {
        if (values.status == '200') {
          myotp.value = values.otp!;

          Get.toNamed(AppRoutes.OtpPage,arguments: myotp);

         // print('Controller Page OTP: ${myotp}');
        } else {

        }
      } else {
    //    toast("Unregistered mobile number!");

      }
    });
  }



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}