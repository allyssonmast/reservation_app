import 'package:injectable/injectable.dart';

import '../../../../data/restaurante_repository_I.dart';
import '../../../../data/shared_preference_helper.dart';
import '../models/index.dart';
import 'usecase_interface.dart';


@Injectable(as: DataUseCase<Tables>)
class TablesDataUseCaseImp implements DataUseCase<Tables> {
  final SharedPrefsHelper prefsHelper;
  final IRestaurantRepository repository;
  String TABLES_REMOTE = 'TABLES_REMOTE';
  TablesDataUseCaseImp(this.prefsHelper, this.repository);

  @override
  Future<List<Tables>> getData() async {
    final List<Tables> tablesFromPrefs = prefsHelper.getDataFromRemote(
        TABLES_REMOTE, (json) => Tables.fromJson(json));

    if (tablesFromPrefs.isNotEmpty) {
      return tablesFromPrefs;
    } else {
      var list = await repository.getTables();
      await saveData(list);
      return list;
    }
  }

  @override
  Future<void> saveData(List<Tables> data) async {
    await prefsHelper.saveDataToSharedPreferences(TABLES_REMOTE, data);
  }
}
