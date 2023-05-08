import 'dart:convert';

import 'package:chef_kart/models/detail_model.dart';
import 'package:chef_kart/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../services/api_services.dart';

class DetailController extends GetxController {
  final isLoading = true.obs;
  final isValid = false.obs;
  var detailModel = Rxn<DetailModel>();

  @override
  void onInit() {
    getFood();
    super.onInit();
  }

  final isLogin = false.obs;
  final isPrefs = false.obs;

  var res;

  Future<void> getFood() async {
    try {
      isLoading(true);
      var data = await RemoteService.get(key: "1");
      print(data);
      if (data != null) {
        res = DetailModel.fromJson(json.decode(data));
        print(res);
        detailModel.value = res;
        isLoading(false);
      }
    } on Exception catch (e) {
      isLoading(false);
      debugPrint(e.toString());
      update();
    }
  }
}
