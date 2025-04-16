import 'dart:convert';
import 'dart:io';

import 'package:apartment_tow/core/SERVER/apartment.dart';
import 'package:apartment_tow/core/SERVER/root_link_api.dart';
import 'package:apartment_tow/core/error/exceptions.dart';
import 'package:apartment_tow/core/error/failure.dart';
import 'package:apartment_tow/core/error/function_to_exciprtion.dart';
import 'package:apartment_tow/core/local_api/local_data_source.dart';
import 'package:apartment_tow/core/network/network.dart';
import 'package:apartment_tow/core/upload_packge/upload_File.dart';
import 'package:apartment_tow/featuers/aprtment/model/aprtment_Model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/connect.dart';

abstract class ApartmentRepoistory {
  Future<Either<Failure, List<Apartment>>> getApartMent({
    bool forUser = true,
    int? id,
  });
  Future<Either<Failure, Unit>> addApartment({required Apartment apartment});
  Future<Either<Failure, String>> uploadImageApartment({required File image});
  Future<Either<Failure, Unit>> deleteApartment({required String id});
  Future<Either<Failure, Unit>> updateApartment({required Apartment apartment});
  Future<Either<Failure, Unit>> addRequst({
    required int apartmentID,
    required String name,
    required String phone,
    required int children,
    required int jopID,
    required int guaranteesID,
  });
  Future<Either<Failure, List<Apartment>>> getApartMentByType({
    required int typeID,
  });

  Future<Either<Failure, List<Apartment>>> search({
    required String qury,
    required String coloumn,
  });
}

class ApartmentRepoistoryImpl implements ApartmentRepoistory {
  final GetConnect getConnect;
  final NetworkInfo networkInfo;
  final UploaidFiles uploaidFiles;
  final LocalDataSource localDataSource;

  ApartmentRepoistoryImpl({
    required this.getConnect,
    required this.networkInfo,
    required this.uploaidFiles,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, Unit>> addApartment({
    required Apartment apartment,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final userInfo = await localDataSource.getCachedUser();
        apartment.userName = userInfo.id.toString();
        final body = apartment.toJson();
        print("hi from Repository");
        final response = await getConnect.post(
          ApartMentApiLink.add,
          jsonEncode(body),
        );
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          if (jsonData['status']) {
            return Right(unit);
          } else {
            throw codeToException(jsonData['code']);
          }
        } else {
          throw ServerException();
        }
      } else {
        throw OfflineException();
      }
    } on Exception catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteApartment({required String id}) async {
    try {
      if (await networkInfo.isConnected) {
        final body = {"id": id};
        final response = await getConnect.post(
          ApartMentApiLink.delete,
          jsonEncode(body),
        );
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          if (jsonData['status']) {
            return Right(unit);
          } else {
            throw codeToException(jsonData['code']);
          }
        } else {
          throw ServerException();
        }
      } else {
        throw OfflineException();
      }
    } on Exception catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Apartment>>> getApartMent({
    bool forUser = true,
    int? id,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final userInfo = await localDataSource.getCachedUser();

        final body = {"user_id": forUser ? null : userInfo.id, "id": id};
        final response = await getConnect.post(
          ApartMentApiLink.view,
          jsonEncode(body),
        );
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          if (jsonData['status']) {
            final lsitData = jsonData['data'] as List;
            return Right(
              lsitData.map<Apartment>((e) => Apartment.fromJson(e)).toList(),
            );
          } else {
            throw codeToException(jsonData['code']);
          }
        } else {
          throw ServerException();
        }
      } else {
        throw OfflineException();
      }
    } on Exception catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Apartment>>> search({
    required String qury,
    required String coloumn,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        String url = "${ApartMentApiLink.shearch}?search=$qury";
        final response = await getConnect.get(url);
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          if (jsonData['status']) {
            final lsitData = jsonData['data'] as List;
            return Right(
              lsitData.map<Apartment>((e) => Apartment.fromJson(e)).toList(),
            );
          } else {
            throw codeToException(jsonData['code']);
          }
        } else {
          throw ServerException();
        }
      } else {
        throw OfflineException();
      }
    } on Exception catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateApartment({
    required Apartment apartment,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final userInfo = await localDataSource.getCachedUser();
        apartment.userName = userInfo.id.toString();
        final body = apartment.toJson();
        final response = await getConnect.post(
          ApartMentApiLink.update,
          jsonEncode(body),
        );
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          if (jsonData['status']) {
            return Right(unit);
          } else {
            throw codeToException(jsonData['code']);
          }
        } else {
          throw ServerException();
        }
      } else {
        throw OfflineException();
      }
    } on Exception catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImageApartment({
    required File image,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        String url = await uploaidFiles.uploadFile(
          file: image,
          foleder: "apratments",
          url: uploadFileLink,
        );
        return Right(url);
      } else {
        throw OfflineException();
      }
    } on Exception catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Apartment>>> getApartMentByType({
    required int typeID,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final body = {"type": typeID};
        final response = await getConnect.post(
          ApartMentApiLink.viewByType,
          jsonEncode(body),
        );
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          if (jsonData['status']) {
            final lsitData = jsonData['data'] as List;
            return Right(
              lsitData.map<Apartment>((e) => Apartment.fromJson(e)).toList(),
            );
          } else {
            throw codeToException(jsonData['code']);
          }
        } else {
          throw ServerException();
        }
      } else {
        throw OfflineException();
      }
    } on Exception catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> addRequst({
    required int apartmentID,
    required String name,
    required String phone,
    required int children,
    required int jopID,
    required int guaranteesID,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final userInfo = await localDataSource.getCachedUser();

        final body = {
          "user_id": userInfo.id,
          "apratment_id": apartmentID,
          "phoneNumber": phone,
          "jop_type_id": jopID,
          "types_guarantees_id": guaranteesID,
          "children": children,
        };
        final response = await getConnect.post(
          ApartMentApiLink.addOrder,
          jsonEncode(body),
        );
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          if (jsonData['status']) {
            return Right(unit);
          } else {
            throw codeToException(jsonData['code']);
          }
        } else {
          throw ServerException();
        }
      } else {
        throw OfflineException();
      }
    } on Exception catch (e) {
      return Left(exceptionToFailure(e));
    }
  }
}
