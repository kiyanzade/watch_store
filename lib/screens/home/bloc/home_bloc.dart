import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/home_model.dart';
import 'package:watch_store_app/data/repository/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository _homeRepository;
  HomeBloc(this._homeRepository) : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitEvent) {
        emit(HomeLoadingState());
        try {
          final HomeModel home = await _homeRepository.getHomeData();
          emit(HomeSuccessLoadState(home));
        } on Exception catch (e) {
          emit(HomeErrorState(e.toString()));
        }
      }
    });
  }
}
