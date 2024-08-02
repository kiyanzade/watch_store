import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/model/home_model.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class IHomeDataSource {
  Future<HomeModel> getHomeData();
}

class RemoteHomeDataSource extends IHomeDataSource {
  final Dio _httpClient;

  RemoteHomeDataSource(this._httpClient);
  @override
  Future<HomeModel> getHomeData() async {
    final HomeModel homeModel;
    final Response<String> res = await _httpClient.get('${baseUrl}home');
    HTTPResponseValidator.isValidStatusCode(res.statusCode ?? 0);

    debugPrint(res.data);
    homeModel = homeModelFromJson(res.data!);
    return homeModel;
  }
}
