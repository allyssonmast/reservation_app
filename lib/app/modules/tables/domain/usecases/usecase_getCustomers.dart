import 'package:flutter_mobile_engineer/app/modules/tables/domain/usecases/usecase_interface.dart';

import 'package:injectable/injectable.dart';

import '../../../../data/restaurante_repository_I.dart';
import '../../../../data/shared_preference_helper.dart';
import '../models/index.dart';

@Injectable(as: DataUseCase<Customers>)
class CustomersDataUseCaseImp implements DataUseCase<Customers> {
  final SharedPrefsHelper prefsHelper;
  final IRestaurantRepository repository;
  String CUSTOMERES_REMOTE = 'CUSTOMERES_REMOTE';

  CustomersDataUseCaseImp(this.prefsHelper, this.repository);

  @override
  Future<List<Customers>> getData() async {
    final List<Customers> customersFromPrefs =
    prefsHelper.getDataFromRemote(CUSTOMERES_REMOTE, (json) => Customers.fromJson(json));

    if (customersFromPrefs.isNotEmpty) {
      return customersFromPrefs;
    } else {
      var list = await repository.getCustomers();
      await saveData(list);
      return list;
    }
  }

  @override
  Future<void> saveData(List<Customers> data) async {
    await prefsHelper.saveDataToSharedPreferences(CUSTOMERES_REMOTE, data);
  }
}
