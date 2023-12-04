import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flight_task_test/app/data/models/respons_model.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/translations/strings_enum.dart';
import '../../../utils/app_constants.dart';
import '../models/failures.dart';
import '../models/success.dart';
import 'init_settings_repository.dart' as init_settings_repo;

class MainDataRepository {
  dio.Dio client = dio.Dio();

  static const String urlPath = 'https://api.jsky.rs4it.com/api/flights/result';

  Future<Either<Failure, Datum>> getFlights(
      {String? date,
      int? adultCount,
      int? childCount,
      int? infantsCount,
      String? cabin}) async {
    try {
      bool isConnected = await checkInternetConnection();
      if (!isConnected) {
        return Left(Failure(-1, Strings.checkInternetConnection));
      }
      final response = await client.get(urlPath, queryParameters: {
        'currency': 'SAR',
        'from': 'RUH',
        'to': 'BOM',
        'date': date,
        'ret_date': null,
        'adults': adultCount,
        'children': childCount,
        'infants': infantsCount,
        'cabin': cabin,
        'nonStop': true,
        'maxPrice': null,
        'max': 15,
      });
      if (response.statusCode == 200) {
        Respons res = Respons.fromJson(response.data);
        if(res.status != 1){
          return Left(Failure(-1, response.data['message']));
        }else{
          return Right(res.data!);
        }
      } else {
        return Left(Failure(-1, Strings.unKnownErrorOccurred));
      }
    } catch (e) {
      return Left(Failure(-1, Strings.unKnownErrorOccurred));
    }
  }

  /// general functions

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  String getServerApiUrl(apiName) {
    return '${AppConstants.serverApiPath}$apiName';
  }
}
