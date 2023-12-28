import 'package:injectable/injectable.dart';
import '../../../../data/restaurante_repository_I.dart';
import '../../../../data/shared_preference_helper.dart';
import '../models/index.dart';
import 'usecase_interface.dart';

@Injectable(as: DataUseCase<Reservation>)
class ReservationsDataUseCaseImp implements DataUseCase<Reservation> {
  final SharedPrefsHelper prefsHelper;
  final IRestaurantRepository repository;
  String RESERVATION_REMOTE = 'RESERVATION_REMOTE';

  ReservationsDataUseCaseImp(this.prefsHelper, this.repository);

  @override
  Future<List<Reservation>> getData() async {
    final List<Reservation> reservationsFromPrefs =
        prefsHelper.getDataFromRemote(
            RESERVATION_REMOTE, (json) => Reservation.fromJson(json));

    if (reservationsFromPrefs.isNotEmpty) {
      return reservationsFromPrefs;
    } else {
      var list = await repository.getReservations();
      await saveData(list);
      return list;
    }
  }

  @override
  Future<void> saveData(List<Reservation> data) async {
    await prefsHelper.saveDataToSharedPreferences(RESERVATION_REMOTE, data);
  }
}
