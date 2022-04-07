import 'dart:convert';

import 'package:getx_project_flutter/model/Customer.dart';
import 'package:getx_project_flutter/model/login_response.dart';
import 'package:getx_project_flutter/utility/Constants.dart';
import 'package:http/http.dart' as http;
class ApiProvider {

/*Login*/
  Future<LoginResponse> login(String mobile) async {
    var client = http.Client();
    LoginResponse loginResponse = LoginResponse();
    try {
      var response =
      await client.post(Uri.parse(BASE_URL + endpoint_login), headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "X-API-KEY": "79b8428a0dea686430a7f20ccbe857bd"
      }, body: {
        "mobile": mobile
      });

     // print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var str = json.decode(jsonString);
        loginResponse = LoginResponse.fromJson(str);
        return loginResponse;
      }
    } catch (Exception) {
      print(Exception);
    }

    return loginResponse;
  }


  /*Customer*/
  Future<List<Customer>> getAllCustomerData() async {
    var client = http.Client();

    Iterable customerList;
    Customer customer = Customer();

      var response =
      await client.get(Uri.parse(BASE_URL + endpoint_customer_get));


      if (response.statusCode == 200) {
        var jsonString = response.body;
        customerList = json.decode(jsonString);
        return customerList
            .map((customers) => Customer.fromJson(customers))
            .toList();
      } else {
        return Future.error("Something went wrong");
      }

    /*  if (response.statusCode == 200) {
        var jsonString = response.body;
        customerList = json.decode(jsonString);

        return customerList
            .map((customer) => Customer.fromJson(customer))
            .toList();
      }*/

  }
  

}