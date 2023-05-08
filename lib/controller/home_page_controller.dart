import 'dart:convert';

import 'package:chef_kart/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../services/api_services.dart';

class HomePageController extends GetxController {
  final isLoading = true.obs;
  final isValid = false.obs;
  var foodModel = Rxn<FoodModel>();

  @override
  void onInit() {
    getFood();
    super.onInit();
  }

  final isLogin = false.obs;
  final number = 0.obs;

  var res;
  late RxMap<String, int> myMap;
  // var myList = <bool>[].obs;
  // var selected = <bool>[].obs;
  RxList<bool> myList = <bool>[].obs;
  RxList<bool> selected = <bool>[].obs;

  void makeList() {
    for (var i = 0; i < foodModel.value!.dishes.length; i++) {
      myList.add(false);
      // if (myList[i] == true) {
      //   selected.add(true);
      // }
    }
  }

  void makeAdd(int id) {
    myList[id] = !myList[id];
    selected.clear();
    for (var i = 0; i < myList.length; i++) {
      if (myList[i] == true) {
        selected.add(true);
      }
    }
    number.value = selected.length;
    update();
    print(myList);
    print(selected);
  }

  Future<void> getFood() async {
    try {
      isLoading(true);
      var data = await RemoteService.get(key: null);
      print(data);
      if (data != null) {
        res = FoodModel.fromJson(json.decode(data));
        print(res);
        foodModel.value = res;
        makeList();
        isLoading(false);
      }
    } on Exception catch (e) {
      isLoading(false);
      debugPrint(e.toString());
      update();
    }
  }
}
