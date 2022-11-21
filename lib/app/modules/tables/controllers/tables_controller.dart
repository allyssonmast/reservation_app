import 'package:flutter/material.dart';
import 'package:flutter_mobile_engineer/app/data/restaurante_repository_I.dart';
import 'package:flutter_mobile_engineer/app/modules/tables//models/customers.dart';
import 'package:flutter_mobile_engineer/app/modules/tables//models/reservations.dart';
import 'package:flutter_mobile_engineer/app/modules/tables//models/tables.dart';
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
  }

  void feachtData() async {
    isLoading.value = true;
    if (!await isConnected()) {
      hasData.value = false;
      isLoading.value = false;

      showDialog(
          context: Get.context!,
          builder: (_) {
            return const DialogNoConnection();
          });

      return;
    }
    getTables;
    getCustomers;
    getReservations;
  }

  get getTables async => listTables.value = await repository.getTables();
  get getReservations async =>
      listReservations.value = await repository.getReservations();
  get getCustomers async =>
      listCustomers.value = await repository.getCustomers();

  Future<bool> isConnected() async => CheckInternetConection().isConnected();
}
