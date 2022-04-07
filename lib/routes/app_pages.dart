import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_project_flutter/bindings/databinding.dart';
import 'package:getx_project_flutter/main.dart';
import 'package:getx_project_flutter/page/cart_page.dart';
import 'package:getx_project_flutter/page/counter_page.dart';
import 'package:getx_project_flutter/page/getx_list_view.dart';
import 'package:getx_project_flutter/page/getx_post_data.dart';
import 'package:getx_project_flutter/page/home_page.dart';
import 'package:getx_project_flutter/page/otp_page.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.Dashbaord,
      page: () => MyApp(),
     // binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => Home(),
     // binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Cart,
      page: () => Cart(),
     // binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Counter,
      page: () => CounterPage(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.ListViewData,
      page: () => GetxListView(),
       binding: DataBinding(),
    ),
    GetPage(
      name: AppRoutes.PostDataWithGetx,
      page: () => PostData(),
       binding: DataBinding(),
    ),

    GetPage(
      name: AppRoutes.OtpPage,
      page: () => OtpPage(),
    ),

  ];
}