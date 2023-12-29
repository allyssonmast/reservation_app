import 'package:flutter/material.dart';
import 'package:flutter_mobile_engineer/app/helpers/theme/theme.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      darkTheme: darkTheme,
      theme: lightTheme,
      getPages: AppPages.routes,
    ),
  );
}
