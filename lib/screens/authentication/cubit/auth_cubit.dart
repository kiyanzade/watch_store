import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
          debugPrint(value.toString());
          if (value.statusCode == 201) {
            emit(AuthSentCodeState(phoneNumber: phoneNumber));
          } else {
            emit(AuthErrorState(
                error: value.statusMessage ?? 'خطا رخ داده است.'));
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState(error: 'خطای غیر منتظره رخ داده است!'));
    }
  }

  verivyCode(String phoneNumber, String code) async {
    emit(AuthLoadingState());
    try {
      await _dio.post('${baseUrl}check_sms_code',
          data: {'mobile': phoneNumber, 'code': code}).then(
        (value) {
          debugPrint(value.toString());
          if (value.statusCode == 201) {
            if (value.data['data']['is_registered']) {
              emit(AuthVerifiedRegisteredCodeState());
            } else {
              emit(AuthVerifiedNotRegisteredCodeState());
            }
          } else {
            emit(AuthErrorState(
                error: value.statusMessage ?? 'خطا رخ داده است.'));
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState(error: 'خطای غیر منتظره رخ داده است!'));
    }
  }
}
