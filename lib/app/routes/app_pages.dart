import 'package:get/get.dart';
import 'package:modul2mobile/app/modules/get_connect/bindings/get_connect_binding.dart';
import 'package:modul2mobile/app/modules/get_connect/views/get_connect_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.GETCONNECT,
        page: () => ArticlesScreen(),
        binding: GetConnectBinding()),

     ];
}
