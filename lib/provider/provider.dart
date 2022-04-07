import 'package:get/get_connect/connect.dart';
import 'package:getx_project_flutter/utility/Constants.dart';

class Provider extends GetConnect {

  //Login Api
  /// for post requests.
  Future<List<dynamic>> postPersonData(dynamic body) async {
    var res = await post(BASE_URL + endpoint_login, body,
        headers: {"x-api-key": X_API_KEY},
        contentType: "application/x-www-form-urlencoded");
    print(res.body);
    if (res.status.hasError) {
      return Future.error(res.statusText!);
    } else {
      return res.body;
    }
  }


  Future<List<dynamic>> getUser() async {
    final response = await get('https://randomuser.me/api/');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['results'];
    }
  }


}
