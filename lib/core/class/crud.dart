import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:test/core/class/constant/storagehandler.dart';
import 'package:test/core/function/checkinternet.dart';
import 'statusrequest.dart';

class Crud {
  // ================= GET =================
  Future<Either<StatusRequest, Map>> getData(
    String linkurl, {
    Map<String, String>? headers,
  }) async {
    try {
      if (!await checkInternet()) {
        print("🚫 NO INTERNET");
        return const Left(StatusRequest.offlinefailure);
      }

      final token = StorageHandler().token;

      final response = await http.get(
        Uri.parse(linkurl),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          if (headers != null) ...headers,
        },
      );

      print("📥 STATUS: ${response.statusCode}");
      print("📥 BODY: ${utf8.decode(response.bodyBytes)}");

      final Map data = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(data);
      } else {
        return Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("❌ ERROR GET: $e");
      return const Left(StatusRequest.serverExpition);
    }
  }

  // ================= POST =================
  Future<Either<StatusRequest, Map>> postData(
    String linkurl,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    try {
      print("🚀 START REQUEST");
      print("📤 URL: $linkurl");
      print("📦 DATA: $data");

      if (!await checkInternet()) {
        print("🚫 NO INTERNET");
        return const Left(StatusRequest.offlinefailure);
      }

      final token = StorageHandler().token;

      final response = await http.post(
        Uri.parse(linkurl),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          if (headers != null) ...headers,
        },
        body: jsonEncode(data),
      );

      print("📥 STATUS: ${response.statusCode}");
      print("📥 BODY: ${utf8.decode(response.bodyBytes)}");

      final Map responseBody = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(responseBody);
      } else {
        return Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("❌ ERROR POST: $e");
      return const Left(StatusRequest.serverExpition);
    }
  }

  // ================= DELETE =================
  Future<Either<StatusRequest, Map>> deleteData(
    String linkurl,
    Map data,
  ) async {
    try {
      if (!await checkInternet()) {
        print("🚫 NO INTERNET");
        return const Left(StatusRequest.offlinefailure);
      }

      final token = StorageHandler().token;

      final response = await http.delete(
        Uri.parse(linkurl),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );

      print("📥 STATUS: ${response.statusCode}");
      print("📥 BODY: ${utf8.decode(response.bodyBytes)}");

      final Map responseBody = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(responseBody);
      } else {
        return Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("❌ ERROR DELETE: $e");
      return const Left(StatusRequest.serverExpition);
    }
  }

  // ================= PUT =================
  Future<Either<StatusRequest, Map>> putData(
    String linkurl,
    Map data, {
    Map<String, String>? headers,
  }) async {
    try {
      if (!await checkInternet()) {
        print("🚫 NO INTERNET");
        return const Left(StatusRequest.offlinefailure);
      }

      final token = StorageHandler().token;
      final response = await http.put(
        Uri.parse(linkurl),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          if (headers != null) ...headers,
        },
        body: jsonEncode(data),
      );

      print("📥 STATUS: ${response.statusCode}");
      print("📥 BODY: ${utf8.decode(response.bodyBytes)}");

      final Map responseBody = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(responseBody);
      } else {
        return Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("❌ ERROR PUT: $e");
      return const Left(StatusRequest.serverExpition);
    }
  }
}
