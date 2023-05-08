import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/home_page_controller.dart';

class PopularWidget extends StatelessWidget {
  PopularWidget({Key? key}) : super(key: key);
  final HomePageController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _homeController
          .foodModel.value!.popularDishes.length, // number of items in the list
      itemBuilder: (BuildContext context, int index) {
        return popularTile(
            index,
            _homeController.foodModel.value!.popularDishes[index].name,
            _homeController.foodModel.value!.popularDishes[index].image);
      },
    );
  }

  Widget popularTile(index, name, image) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Color.fromARGB(255, 243, 142, 33),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(image),
            child: Container(child: Text(name)),
          ),
        ),
      ),
    );
  }
}

class DateTime extends StatelessWidget {
  const DateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 50,
              color: Colors.black,
            ),
            Container(
              height: 50,
              color: Colors.white,
            )
          ],
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 147, 147, 147),
                        blurRadius: 2.0,
                        spreadRadius: 0.1, //New
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(Icons.calendar_month_outlined),
                          ),
                          Text(
                            '20 May 2023',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: Color.fromARGB(255, 160, 160, 160),
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(Icons.alarm_add_outlined),
                          ),
                          Text(
                            '10:30 Pm - 12:30 Pm',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({Key? key}) : super(key: key);
  List<String> selectItems = [
    "Italian",
    "Indian",
    "Italian",
    "Indian",
    "Italian"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Container(
        height: 30.0, // adjust the height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // number of items in the list
          itemBuilder: (BuildContext context, int index) {
            return selectItemTile(index);
          },
        ),
      ),
    );
  }

  Widget selectItemTile(index) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Text(
            selectItems[index],
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
