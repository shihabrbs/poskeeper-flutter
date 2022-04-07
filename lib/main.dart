import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_flutter/page/home_page.dart';
import 'package:getx_project_flutter/routes/app_pages.dart';
import 'package:getx_project_flutter/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
     initialRoute: AppRoutes.Dashbaord,
     getPages: AppPages.list,
     /* initialRoute: "/",
      getPages: [
        GetPage(
          name: '/',
          page: () => MyApp(),
        ),
        GetPage(
          name: '/home',
          page: () => Home(),
          transition: Transition.leftToRight,
        ),
      ],*/
      home: Scaffold(
        appBar: AppBar(
          title: Text("GetX Apps"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Show SnackBar"),
                  onPressed: () {
                    Get.snackbar(
                      "SnackBar Title", "This will be the snackbar message",
                      snackPosition: SnackPosition.TOP,
                      // titleText: Text(
                      //   "Another Title",
                      //   style: TextStyle(color: Colors.red),
                      // ),
                      // messageText: Text(
                      //   "Another Mesage",
                      //   style: TextStyle(color: Colors.orange),
                      // ),
                      colorText: Colors.black,
                      backgroundColor: Colors.white,
                      borderRadius: 4,
                      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                      //  maxWidth: 200,
                      //  animationDuration: Duration(microseconds: 3000),

                      // backgroundGradient: LinearGradient(
                      //   colors: [
                      //     Colors.orange,Colors.blue,
                      //   ]
                      // ),

                      // borderColor: Colors.purple,
                      // borderWidth: 2,
                      // boxShadows: [
                      //   BoxShadow(
                      //     color: Colors.black,
                      //     offset: Offset(30,50),
                      //     spreadRadius: 10,
                      //     blurRadius: 4,
                      //   )
                      // ],
                      isDismissible: true,
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.red,
                      ),
                      // shouldIconPulse: true,
                    );
                  },
                ),
                RaisedButton(
                  child: Text("Show Dialog"),
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Dialog Title",
                      titleStyle: TextStyle(fontSize: 25),
                      middleText: "This is middle text",
                      middleTextStyle: TextStyle(fontSize: 20),
                      backgroundColor: Colors.red,
                      radius: 10,

                      //To customize the middle text
                      content: Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Text("Data Loading")),
                        ],
                      ),
                      textCancel: "Cancel",
                      cancelTextColor: Colors.white,
                      textConfirm: "Confirm",
                      confirmTextColor: Colors.white,
                      onCancel: () {},
                      onConfirm: () {
                        Get.back();
                      },
                      buttonColor: Colors.green,
                      barrierDismissible: false,
                    );
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Get.bottomSheet(
                        Container(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.wb_sunny_outlined),
                                title: Text("Light Theme"),
                                onTap: () => {
                                  Get.changeTheme(ThemeData.light()),
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.wb_sunny),
                                title: Text("Dark Theme"),
                                onTap: () => {
                                  Get.changeTheme(ThemeData.dark()),
                                },
                              ),
                            ],
                          ),
                        ),
                        barrierColor: Colors.transparent,
                        backgroundColor: Colors.white,
                        isDismissible: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2.0),
                        ));
                  },
                  child: Text(
                    "Bottom Sheet",
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Get.to(
                      Home(),
                      // fullscreenDialog: true,
                      transition: Transition.rightToLeft,
                      //   duration: Duration(milliseconds: 2000),
                      //  curve: Curves.slowMiddle,
                    );

                    //Go to home screen but no option to return to previous screen
                    //  Get.off(Home());
                    //Go to home Screen and cancel all previous screens/routes
                    //Get.offAll(Home());
                    //Go the new Screen with some data
                    //Get.to(Home(),arguments:"Data from Main");
                    //Go to next screen and receive data sent from home screen
                    // var data = await Get.to(Home());
                  },
                  child: Text("Go To Home with Route"),
                ),
                RaisedButton(
                  onPressed: () {
                 //   Get.toNamed('/home');
                    Get.toNamed(AppRoutes.Home);
                  },
                  child: Text(
                    "Go To Home with Name Route",
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //   Get.toNamed('/home');
                    Get.toNamed(AppRoutes.Counter);
                  },
                  child: Text(
                    "Go To Counter Page",
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //   Get.toNamed('/home');
                    Get.toNamed(AppRoutes.ListViewData);
                  },
                  child: Text(
                    "ListView With Getx",
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //   Get.toNamed('/home');
                    Get.toNamed(AppRoutes.PostDataWithGetx);
                  },
                  child: Text(
                    "Login Otp with Getx",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
