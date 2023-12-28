import '../../../helpers/utils/check_internet.dart';
import '../../tables/domain/models/index.dart';
import 'package:flutter_mobile_engineer/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import '../domain/usecases/usecase_interface.dart';

@injectable
class TablesController extends GetxController {
  final CheckInternetConection conection;
  final DataUseCase<Tables> tableUsecase;
  final DataUseCase<Customers> customerUsecase;
  final DataUseCase<Reservation> reservationUsecase;
  TablesController(this.conection, this.tableUsecase, this.customerUsecase,
      this.reservationUsecase);

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

  Future feachtData() async {
    isLoading.value = true;
    hasData.value = true;

    listTables.value = await tableUsecase.getData();
    listCustomers.value = await customerUsecase.getData();
    listReservations.value = await reservationUsecase.getData();

    isLoading.value = false;
    update();
  }

  Future<bool> isConnected() async => await conection.isConnected();

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

  void onTap(Tables tables) {
    Get.toNamed(Routes.CUSTOMERS, arguments: tables);
  }

  void cancelReservation(Tables tables) {
    listReservations.removeWhere((element) => element.tableId == tables.id);
    listTables.sort((a, b) => a.id.compareTo(b.id));
    reservationUsecase.saveData(listReservations);
    Get.back();
  }
}
