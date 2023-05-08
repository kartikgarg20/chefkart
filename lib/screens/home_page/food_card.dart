import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/home_page_controller.dart';
import '../detail_page/detail_page.dart';

class Foodcard extends StatelessWidget {
  Foodcard({Key? key}) : super(key: key);
  final HomePageController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: _homeController.foodModel.value!.dishes.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return menuItem();
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          foodName(index),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                appliances(index),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 30,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                ingredents(context, index)
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              _homeController.foodModel.value!.dishes[index - 1]
                                  .description,
                              maxLines: 4,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    foodItemImage(index)
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                )
              ],
            ),
          );
        }
      },
    );
  }

  Widget menuItem() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Text(
                'Recommended',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget foodName(index) {
    return Row(
      children: [
        Text(
          _homeController.foodModel.value!.dishes[index - 1].name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            alignment: Alignment.center,
            children: const [
              Icon(
                Icons.crop_square_sharp,
                color: Colors.green,
                size: 20,
              ),
              Icon(Icons.circle, color: Colors.green, size: 7),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 20,
            width: 50,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 52, 214, 69),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _homeController.foodModel.value!.dishes[index - 1].rating
                        .toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget foodItemImage(index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.topCenter,
                      image: NetworkImage(
                        _homeController
                            .foodModel.value!.dishes[index - 1].image,
                      ),
                    )),
              ),
              Container(
                height: 20,
                width: 100,
                color: Colors.white,
              )
            ],
          ),
          Positioned.fill(
            child: InkWell(
              onTap: () {
                _homeController.makeAdd(index - 1);
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.amber,
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
                          GetBuilder<HomePageController>(
                              // no need to initialize Controller ever again, just mention the type
                              builder: (value) => Text(
                                  _homeController.myList[index - 1] == true
                                      ? "Added"
                                      : "Add")),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ingredents(context, index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      rating: _homeController
                          .foodModel.value!.dishes[index - 1].rating,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              'Ingridents',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  'View List',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.amber,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 10,
                  color: Colors.amber,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget appliances(index) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _homeController
            .foodModel.value!.dishes[index - 1].equipments.length,
        itemBuilder: (BuildContext context, int ind) {
          print(_homeController
              .foodModel.value!.dishes[index - 1].equipments[ind]);
          if (_homeController
                  .foodModel.value!.dishes[index - 1].equipments[ind] ==
              "Microwave") {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/micro.png",
                    scale: 3,
                  ),
                  const Text(
                    'Microwave',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/fri.png",
                    scale: 3,
                  ),
                  const Text(
                    'Refrigerator',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
