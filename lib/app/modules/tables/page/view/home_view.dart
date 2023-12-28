import 'package:flutter/material.dart';
import 'package:flutter_mobile_engineer/app/modules/tables/page/widget/table_adapter.dart';

import 'package:get/get.dart';

import '../../controllers/tables_controller.dart';
import '../../domain/models/index.dart';
import '../widget/dialog_no_connection.dart';

class HomeView extends GetView<TablesController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('Screen_with_tables'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Tables',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: _buildTablesList(),
    );
  }

  Widget _buildTablesList() {
    return FutureBuilder<bool>(
      future: controller.isConnected(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == false) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (_) => const DialogNoConnection(
                key: Key('No_internet_connection_dialog_is_visible'),
              ),
            );
          });
          return Center(
            child: TextButton.icon(
              onPressed: controller.feachtData,
              icon: const Icon(Icons.update),
              label: const Text('Try again'),
            ),
          );
        } else {
          return _bodyTables();
        }
      },
    );
  }

  Widget _bodyTables() {
    return Obx(
      () => GridView.builder(
        key: const Key('List_of_tables_is_visible'),
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: controller.listTables.length,
        itemBuilder: (_, index) {
          Tables tables = controller.listTables[index];
          Customers? customers = controller.hasCustomers(tables.id);
          return TableAdapter(
            tables: tables,
            customers: customers,
            onTap: (table, customer) {
              if (customers != null) {
                showDialog(
                    context: Get.context!,
                    builder: (_) {
                      return AlertDialog(
                        content: const Text('Cancel Reservation?'),
                        actions: [
                          TextButton(
                              onPressed: () =>
                                  controller.cancelReservation(table),
                              child: const Text('Cancel'))
                        ],
                      );
                    });
              } else {
                controller.onTap(tables);
              }
            },
          );
        },
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1.2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            maxCrossAxisExtent: 240,
            mainAxisExtent: 180),
      ),
    );
  }
}
