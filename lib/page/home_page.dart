import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_flutter/routes/app_routes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            RaisedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Go back To Main"),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed(
                  AppRoutes.Cart,
                );
              },
              child: Text("Go to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
