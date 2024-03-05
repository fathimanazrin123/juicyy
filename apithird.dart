import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:juicejuice/init.dart';
import 'package:juicejuice/logreg.dart';
import 'package:juicejuice/registerpage.dart';
import 'package:juicejuice/url.dart';

class ApiClass {
  ValueNotifier<List<Datum>> productNotifier = ValueNotifier([]);
  ApiClass._internal();
  static ApiClass instance = ApiClass._internal();
  factory() {
    return instance;
  }

  final dio = Dio();
  final url = URL();

  ApiClass() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.json,
    );
  }

  Future<RegisterResponse?> registerUserApi(FormData formData) async {
    try {
      final result = await dio.post(url.registerEndpoint, data: formData);
      return RegisterResponse.fromJson(jsonDecode(result.data));
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<LoginResp?> loginUserApi(FormData formData) async {
    try {
      final result = await dio.post(url.loginEndpoint, data: formData);
      print(result);
      return LoginResp.fromJson(jsonDecode(result.data));
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  getProducts() async {
    final result = await dio.get(url.productBaseUrl + url.productsEndpoint);
    final getProduct = Initialdata.fromJson(result.data);

    if (getProduct.data != null) {
      productNotifier.value.clear();
      productNotifier.value.addAll(getProduct.data!);
    } else {
      productNotifier.value.clear();
    }
  }
}
