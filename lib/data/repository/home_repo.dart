import 'package:watch_store_app/data/config/remote_config.dart';
import 'package:watch_store_app/data/model/home_model.dart';
import 'package:watch_store_app/data/src/home_data_source.dart';

final IHomeRepository homeRepository =
    HomeRepository(RemoteHomeDataSource(DioManager.dio));

abstract class IHomeRepository {
  Future<HomeModel> getHomeData();
}

class HomeRepository extends IHomeRepository {
  final IHomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  @override
  Future<HomeModel> getHomeData() async => await _homeDataSource.getHomeData();
}
