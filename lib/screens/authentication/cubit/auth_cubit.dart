import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:watch_store_app/data/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState()) {
    emit(AuthLoggedOutState());
  }
  final Dio _dio = Dio();

  sendSms(String phoneNumber) async {
    emit(AuthLoadingState());
    try {
      await _dio.post('${baseUrl}send_sms', data: {'mobile': phoneNumber}).then(
        (value) {
          if (value.statusCode == 201) {
            emit(AuthSentCodeState());
          } else {
            emit(AuthErrorState());
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  verivyCode(String phoneNumber, String code) async {
    emit(AuthLoadingState());
    try {
      await _dio.post('${baseUrl}check_sms_code',
          data: {'mobile': phoneNumber, 'code': code}).then(
        (value) {
          if (value.statusCode == 201) {
            emit(AuthVerifyCodeState());
          } else {
            emit(AuthErrorState());
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState());
    }
  }
}