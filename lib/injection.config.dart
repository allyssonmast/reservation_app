// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i3;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'app/config/modules_injectable.dart' as _i18;
import 'app/data/restaurant_api.dart' as _i6;
import 'app/data/restaurant_repository.dart' as _i11;
import 'app/data/restaurante_repository_I.dart' as _i10;
import 'app/data/shared_preference_helper.dart' as _i8;
import 'app/helpers/utils/check_internet.dart' as _i9;
import 'app/modules/tables/controllers/tables_controller.dart' as _i17;
import 'app/modules/tables/domain/models/index.dart' as _i13;
import 'app/modules/tables/domain/usecases/usecase_getCustomers.dart' as _i16;
import 'app/modules/tables/domain/usecases/usecase_getReservation.dart' as _i15;
import 'app/modules/tables/domain/usecases/usecase_getTables.dart' as _i14;
import 'app/modules/tables/domain/usecases/usecase_interface.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule(this);
    gh.lazySingleton<_i3.ChopperClient>(() => appModule.chopperClient);
    gh.lazySingleton<_i4.Connectivity>(() => appModule.connectivity);
    gh.lazySingleton<_i3.JsonConverter>(() => appModule.jsonConverter);
    gh.lazySingleton<_i5.Logger>(() => appModule.logger);
    gh.lazySingleton<_i6.RestaurantApi>(() => appModule.restaurantApi);
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i8.SharedPrefsHelper>(
        () => _i8.SharedPrefsHelper(gh<_i7.SharedPreferences>()));
    gh.factory<_i9.CheckInternetConection>(
        () => _i9.CheckInternetConection(gh<_i4.Connectivity>()));
    gh.factory<_i10.IRestaurantRepository>(
        () => _i11.RestaurantRepository(gh<_i6.RestaurantApi>()));
    gh.factory<_i12.DataUseCase<_i13.Tables>>(() => _i14.TablesDataUseCaseImp(
          gh<_i8.SharedPrefsHelper>(),
          gh<_i10.IRestaurantRepository>(),
        ));
    gh.factory<_i12.DataUseCase<_i13.Reservation>>(
        () => _i15.ReservationsDataUseCaseImp(
              gh<_i8.SharedPrefsHelper>(),
              gh<_i10.IRestaurantRepository>(),
            ));
    gh.factory<_i12.DataUseCase<_i13.Customers>>(
        () => _i16.CustomersDataUseCaseImp(
              gh<_i8.SharedPrefsHelper>(),
              gh<_i10.IRestaurantRepository>(),
            ));
    gh.factory<_i17.TablesController>(() => _i17.TablesController(
          gh<_i9.CheckInternetConection>(),
          gh<_i12.DataUseCase<_i13.Tables>>(),
          gh<_i12.DataUseCase<_i13.Customers>>(),
          gh<_i12.DataUseCase<_i13.Reservation>>(),
        ));
    return this;
  }
}

class _$AppModule extends _i18.AppModule {
  _$AppModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.RestaurantApi get restaurantApi => _i6.RestaurantApi.createWithConverter(
        _getIt<_i3.ChopperClient>(),
        _getIt<_i3.JsonConverter>(),
      );
}
