import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:test/core/class/constant/storagehandler.dart';
import 'package:test/core/function/checkinternet.dart';

import 'statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> getData(
    String linkurl,
    Map? data, {
    Map<String, String>? headers,
  }) async {
    try {
      if (await checkInternet()) {
        final token = StorageHandler().token;
        print("🔐 Token being sent: $token");

        final response = await http.get(
          Uri.parse(linkurl),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            if (token != null) 'Authorization': 'Bearer $token',
            if (headers != null) ...headers,
          },
        );

        print("🌐 Response Status Code: ${response.statusCode}");
        print("📦 Response Body: ${utf8.decode(response.bodyBytes)}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(utf8.decode(response.bodyBytes));
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("❌ Exception: $e");
      return const Left(StatusRequest.serverExpition);
    }
  }

  Future<Either<StatusRequest, Map>> postData(
    String linkurl,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  ) async {
    try {
      if (await checkInternet()) {
        final token = StorageHandler().token;

        final allHeaders = <String, String>{
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          if (headers != null) ...headers,
        };

        final body = data == null ? null : jsonEncode(data);
        final response = await http.post(
          Uri.parse(linkurl),
          headers: allHeaders,
          body: body,
        );

        final Map responsebody = jsonDecode(utf8.decode(response.bodyBytes));
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverExpition);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(
    String linkurl,
    Map data,
  ) async {
    try {
      if (await checkInternet()) {
        final token = StorageHandler().token;
        final headers = {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        };
        final response = await http.delete(
          Uri.parse(linkurl),
          headers: headers,
          body: jsonEncode(data),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverExpition);
    }
  }

  Future<Either<StatusRequest, Map>> putData(
    String linkurl,
    Map data, {
    Map<String, String>? headers,
  }) async {
    try {
      if (await checkInternet()) {
        final token = StorageHandler().token;
        final allHeaders = <String, String>{
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          if (headers != null) ...headers,
        };
        final response = await http.put(
          Uri.parse(linkurl),
          headers: allHeaders,
          body: jsonEncode(data),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverExpition);
    }
  }
}
