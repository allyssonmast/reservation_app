import 'package:flutter/material.dart';
import 'package:flutter_mobile_engineer/app/data/restaurante_repository_I.dart';
import 'package:flutter_mobile_engineer/app/modules/tables/models/customers.dart';
import 'package:flutter_mobile_engineer/app/modules/tables/models/reservations.dart';
import 'package:flutter_mobile_engineer/app/modules/tables/models/tables.dart';
import 'package:flutter_mobile_engineer/app/utils/check_internet.dart';
import 'package:get/get.dart';

import '../views/widget/dialog_no_connection.dart';

class TablesController extends GetxController {
  final IRestaurantRepository repository;

  TablesController(this.repository);

  var listTables = RxList<Tables>();
  var listReservations = RxList<Reservation>();
  var listCustomers = RxList<Customers>();

  var isLoading = RxBool(true);
  var hasData = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    feachtData();
  }

  void feachtData() async {
    isLoading.value = true;
    hasData.value=true;
    if (!await isConnected()) {
      hasData.value = false;
      isLoading.value = false;

      update();
      showDialog(
          context: Get.context!,
          builder: (_) {
            return const DialogNoConnection();
          });

      return;
    }
    await getTables;
    await getCustomers;
    await getReservations;
    isLoading.value = false;
    update();
  }

  get getTables async => listTables.value = await repository.getTables();
  get getReservations async =>
      listReservations.value = await repository.getReservations();
  get getCustomers async =>
      listCustomers.value = await repository.getCustomers();

  Future<bool> isConnected() async => CheckInternetConection().isConnected();

  Customers? hasCustomers(int tableId) {
    Reservation? reservation = listReservations
        .firstWhereOrNull((element) => element.tableId == tableId);
    Customers? customers;
    if (reservation != null) {
      return listCustomers
          .firstWhereOrNull((element) => element.id == reservation.userId);
    }

    return customers;
  }
}
