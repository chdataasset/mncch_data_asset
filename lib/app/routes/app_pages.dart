import 'package:get/get.dart';

import '../modules/detailitem/bindings/detailitem_binding.dart';
import '../modules/detailitem/views/detailitem_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view_small.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login.dart';
import '../modules/login/views/login_view_mobile.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/tambah/bindings/tambah_binding.dart';
import '../modules/tambah/views/tambah_view.dart';
import '../modules/tambah/views/tambah_view_small.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH,
      page: () => TambahView(),
      binding: TambahBinding(),
    ),
    GetPage(
      name: _Paths.DETAILITEM,
      page: () => DetailitemView(),
      binding: DetailitemBinding(),
    ),
  ];
}
