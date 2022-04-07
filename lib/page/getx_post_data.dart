import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_project_flutter/Controller/datacontroller.dart';
import 'package:getx_project_flutter/Controller/localdb_controller.dart';
import 'package:getx_project_flutter/Controller/login_controller.dart';
import 'package:getx_project_flutter/routes/app_routes.dart';

class PostData extends GetView<DataController> {
  PostData({Key? key}) : super(key: key);
  TextEditingController mycontroller = TextEditingController();
  var _mobileController = new MaskedTextController(mask: '00000-000000');
  final controller = Get.find<DataController>();
  final localDbController = Get.put(LocalDbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Mobile',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // DataController.to.postData(_mobileController.text);
                DataController.to.checkLogin(_mobileController.text);
                LocalDbController.to.addCustomerToLocal();

              },
              child: Text(
                "ListView With Getx",
              ),
            ),
            Obx(
              () => Text(controller.myotp.value),
            )
          ],
        ),
      ),
    );
  }
}
