import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../data_source/api_service.dart';
import '../model/failure_model.dart';
import '../model/request_models.dart';
import '../model/response_model.dart';
import '../network/network_info.dart';

abstract class Repository {
  Future<Either<Failure, ResponseModel>> register(RegisterRequestModel data);
  Future<Either<Failure, ResponseModel>> login(LoginRequestModel data);
  Future<Either<Failure, ResponseModel>> forgotPass(
      ForgotPassRequestModel data);
  Future<Either<Failure, ResponseModel>> resetPass(ResetPassRequestModel data);
}

class RepositoryImpl implements Repository {
  final ApiService _apiService;
  final NetworkInfo _networkInfo;
  RepositoryImpl({
    required ApiService apiService,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _apiService = apiService;

  @override
  Future<Either<Failure, ResponseModel>> register(
      RegisterRequestModel data) async {
    if (await _networkInfo.isConnected) {
      final response = await _apiService.postData(
        endPoint: DataConstants.register,
        data: data.toJson(),
      );
      log(response.data.toString());
      return Right(ResponseModel.fromJson(response.data));
    } else {
      return Left(Failure("Check your network connection"));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> login(LoginRequestModel data) async {
    if (await _networkInfo.isConnected) {
      final response = await _apiService.postData(
        endPoint: DataConstants.login,
        data: data.toJson(),
      );
      log(response.data.toString());
      return Right(ResponseModel.fromJson(response.data));
    } else {
      return Left(Failure("Check your network connection"));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> forgotPass(
      ForgotPassRequestModel data) async {
    if (await _networkInfo.isConnected) {
      final response = await _apiService.postData(
        endPoint: DataConstants.forgotPassword,
        data: data.toJson(),
      );
      log(response.data.toString());
      return Right(ResponseModel.fromJson(response.data));
    } else {
      return Left(Failure("Check your network connection"));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> resetPass(
      ResetPassRequestModel data) async {
    if (await _networkInfo.isConnected) {
      final response = await _apiService.postData(
        endPoint: DataConstants.resetPassword,
        data: data.toJson(),
      );
      log(response.data.toString());
      return Right(ResponseModel.fromJson(response.data));
    } else {
      return Left(Failure("Check your network connection"));
    }
  }
}
