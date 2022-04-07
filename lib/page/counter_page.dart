import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_flutter/Controller/counter_controller.dart';
import 'package:getx_project_flutter/Controller/login_controller.dart';

class CounterPage extends GetView<LoginController> {
  CounterPage({Key? key}) : super(key: key);

 // final controller = Get.put(CounterController());
  //final LoginController controller = Get.find<LoginController>();
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Reactive State Management

             GetX<CounterController>(
              init: CounterController(),
              builder: (controller) => Text(
                '${controller.count.value}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),


           /* Obx(
              () => Text(
                '${controller.count.value}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),*/


            //Simple state Management
          /*  GetBuilder<CounterController>(
              id: 'count1',
              init: CounterController(),
              builder: (controller) => Text('${controller.count}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  )),
            ),*/

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Obx(() => TextFormField(
                  controller: controller.passwordTextController,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                    suffixIcon: IconButton(
                      icon: controller.hidePassword.value ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        controller.hidePassword.value = !controller.hidePassword.value;
                      },
                    ),

                  ),
                ),
              ),
            ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
       // onPressed: () => Get.find<CounterController>().increment(),
         onPressed: () {
           CounterController.to.increment();
         },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
