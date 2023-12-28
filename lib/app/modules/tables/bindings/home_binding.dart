import 'package:flutter_mobile_engineer/injection.dart';
import 'package:get/get.dart';
import '../controllers/tables_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TablesController>(() => getIt<TablesController>());
  }
}
