import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/routes/app_pages.dart';

import 'models/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Supabase supabase = await Supabase.initialize(
    url: BaseUrl.cBaseUrl,
    anonKey: BaseUrl.cAnonKey,
  );

  final SupabaseClient clients =
      SupabaseClient(BaseUrl.cBaseUrl, BaseUrl.cAnonKey);
  runApp(
    GetMaterialApp(
      theme: ThemeData(
          primaryColor: kLightBlue,
          iconTheme: IconThemeData(color: Colors.lightBlueAccent)),
      debugShowCheckedModeBanner: false,
      title: "MNC Channels Dta Asset",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
