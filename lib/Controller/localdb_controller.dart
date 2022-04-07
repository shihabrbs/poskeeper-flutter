import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_project_flutter/database/DatabaseHelper.dart';
import 'package:getx_project_flutter/model/Customer.dart';
import 'package:getx_project_flutter/provider/api_provider.dart';

class LocalDbController extends GetxController
    with SingleGetTickerProviderMixin {
  static LocalDbController get to => Get.find();
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  var isLoading = true.obs;

  RxList<Customer> customerList = RxList<Customer>();

  List<Customer> _listcus = [];

  @override
  void onInit() {
   // getHomeMatches();
    // TODO: implement onInit
    super.onInit();
  }




  void getHomeMatches() async {

     ApiProvider().getAllCustomerData().then((value) {

     value.forEach((element) {
       customerList.add(element);
       _listcus.add(Customer.fromJson(element.toJson()));

     });


   //  print('name: ${customerList[0].name},\n Mobile: ${customerList[0].mobile}');
       print(_listcus[0].name);

    });
  }

  void addCustomerToLocal() {
    getHomeMatches();
    DatabaseHelper.instance.insertAllCustomer(_listcus.toList());

    Future<int?> total = databaseHelper.getTotalCount('customer');


    print("Total Customer: $total");
  }
}
