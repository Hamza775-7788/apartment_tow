import 'dart:convert';

import 'package:apartment_tow/core/SERVER/shared_Link_API.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/core/network/network.dart';
import 'package:apartment_tow/featuers/shared/model/ItemModel.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

abstract class SharedRepository {
  Future<Either<Failure, List<EilmentModel>>> getApratmentType();
  Future<Either<Failure, List<EilmentModel>>> getGuarantees();
  Future<Either<Failure, List<EilmentModel>>> getJop();
}

class SharedRepositoryImpl implements SharedRepository {
  final GetConnect getConnect;
  final NetworkInfo networkInfo;

  SharedRepositoryImpl({required this.getConnect, required this.networkInfo});

  @override
  Future<Either<Failure, List<EilmentModel>>> getApratmentType() async {
    if (await networkInfo.isConnected) {
      final response = await getConnect.get(SharedLinkAPI.viewApratmentType);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          final listData = jsonData['data'] as List;
          return Right(
            listData
                .map<EilmentModel>((e) => EilmentModel.fromJson(e))
                .toList(),
          );
        } else {
          return Left(OperationNotCompletedFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<EilmentModel>>> getGuarantees() async {
    if (await networkInfo.isConnected) {
      final response = await getConnect.get(SharedLinkAPI.viewGuarantees);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          final listData = jsonData['data'] as List;
          return Right(
            listData
                .map<EilmentModel>((e) => EilmentModel.fromJson(e))
                .toList(),
          );
        } else {
          return Left(OperationNotCompletedFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<EilmentModel>>> getJop() async {
    if (await networkInfo.isConnected) {
      final response = await getConnect.get(SharedLinkAPI.viewJop);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          final listData = jsonData['data'] as List;
          return Right(
            listData
                .map<EilmentModel>((e) => EilmentModel.fromJson(e))
                .toList(),
          );
        } else {
          return Left(OperationNotCompletedFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
