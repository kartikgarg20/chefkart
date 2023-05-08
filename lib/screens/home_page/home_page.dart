import 'package:chef_kart/screens/detail_page/detail_page.dart';
import 'package:chef_kart/screens/home_page/food_card.dart';
import 'package:chef_kart/screens/home_page/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController _homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
          elevation: 0,
          title: const Text(
            "Select Dishes",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Obx(
          () => Stack(
            children: [
              Column(
                children: [
                  DateTime(),
                  ItemWidget(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Popular Dishes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: Container(
                        height: 70.0, // adjust the height as needed
                        // ignore: deprecated_member_use
                        child: _homeController.isLoading.isTrue
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : PopularWidget()),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 216, 216, 216),
                    thickness: 4,
                  ),
                  Expanded(
                    child: _homeController.isLoading.isTrue
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Foodcard(),
                  )
                ],
              ),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.food_bank_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "  ${_homeController.number}  Food items selected",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward, color: Colors.white)
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
