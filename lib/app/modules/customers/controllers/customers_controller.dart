import 'package:flutter_mobile_engineer/app/modules/tables/controllers/tables_controller.dart';

import 'package:get/get.dart';

import '../../tables/domain/models/index.dart';

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

  void onTapCustomer(Customers customers) {
    Reservation reservation = Reservation(
        userId: customers.id,
        tableId: tables.id,
        id: tablesController.listReservations.last.id + 1);

    tablesController.listReservations.add(reservation);
    tablesController.listTables.sort((a, b) => a.id.compareTo(b.id));
    tablesController.reservationUsecase
        .saveData(tablesController.listReservations);

    Get.back();
  }
}
