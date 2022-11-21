import 'package:flutter_mobile_engineer/app/modules/tables/controllers/tables_controller.dart';
import 'package:flutter_mobile_engineer/app/modules/tables/models/customers.dart';
import 'package:flutter_mobile_engineer/app/modules/tables/models/tables.dart';
import 'package:get/get.dart';

class CustomersController extends GetxController {
  final TablesController tablesController;

  CustomersController(this.tablesController);

  final Tables tables = Get.arguments;

  var listCustomer = RxList<Customers>();

  @override
  void onInit() {
    super.onInit();
    getCustomers;
  }

  get getCustomers {
    listCustomer.value = tablesController.listCustomers;
  }
}
