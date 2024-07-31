import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/model/user_register_model.dart';
import 'package:watch_store_app/utils/shared_preferences_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  final Dio _dio = Dio();

   pickTheLocation({required context}) async {
    await showSimplePickerLocation(
            isDismissible: true,
            title: "انتخاب موقعیت مکانی",
            textCancelPicker: "لغو",
            textConfirmPicker: "انتخاب",
            zoomOption: const ZoomOption(initZoom: 8),
            // initCurrentUserPosition: UserTrackingOption.withoutUserPosition(),
            initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
            radius: 8.0,
            context: context)
        .then((value) => emit(RegisterLocationPickedState(location: value)));
  }

  void register({required UserRegisterModel user}) async {
    emit(RegisterLoadingState());
    debugPrint(user.toJson().toString());
    try {
      String? token = SharedPreferencesManager().getString('token');

      _dio.options.headers["Authorization"] = "Bearer $token";
      await _dio
          .post(
        '${baseUrl}register',
        data: FormData.fromMap(user.toJson()),
      )
          .then((value) {
        debugPrint(value.statusCode.toString());
        if (value.statusCode == 201) {
          emit(RegisterOkResponseState());
        } else {
          emit(RegisterErrorState());
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(RegisterErrorState());
    }
  }
}
