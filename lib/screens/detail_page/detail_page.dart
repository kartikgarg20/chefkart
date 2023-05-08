import 'package:chef_kart/controller/detail_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final double rating;
  DetailPage({Key? key, required this.rating}) : super(key: key);
  final DetailController _detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              )),
        ),
        backgroundColor: Colors.white,
        body: Obx(
          () => _detailController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Expanded(
                    child: Column(
                      children: [
                        dishName(),
                        const Divider(
                          color: Color.fromARGB(255, 199, 199, 199),
                          thickness: 2,
                        ),
                        ingredenets(),
                        const Divider(
                          color: Color.fromARGB(255, 199, 199, 199),
                          thickness: 1,
                        ),
                        vegetable(),
                        spices(),
                        appliances()
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget ingredenets() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "For 2 People",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dishName() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              _detailController.detailModel.value!.name,
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 20,
                width: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 52, 214, 69),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        rating.toString(),
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
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Mughlai cuisine developed in the urban centers of medieval India.  At that time, India was ruled by the Turco-Mongol Mughal Empire.  ",
                      maxLines: 6,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(_detailController.detailModel.value!.timeToPrepare)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    image: AssetImage('assets/images/biryani.jpg'),
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Widget vegetable() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Vegetables (${_detailController.detailModel.value!.ingredients.vegetables.length})',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _detailController
              .detailModel.value!.ingredients.vegetables.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text(
                      _detailController.detailModel.value!.ingredients
                          .vegetables[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      _detailController.detailModel.value!.ingredients
                          .vegetables[index].quantity,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget spices() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Spices (${_detailController.detailModel.value!.ingredients.spices.length})',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount:
              _detailController.detailModel.value!.ingredients.spices.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text(
                      _detailController
                          .detailModel.value!.ingredients.spices[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      _detailController.detailModel.value!.ingredients
                          .vegetables[index].quantity,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget appliances() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Appliances',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _detailController
                    .detailModel.value!.ingredients.appliances.length,
                itemBuilder: (BuildContext context, int ind) {
                  if (_detailController.detailModel.value!.ingredients
                          .appliances[ind].name ==
                      "Microwave") {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/micro.png",
                            scale: 2,
                          ),
                          const Text(
                            'Microwave',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  } else if (_detailController.detailModel.value!.ingredients
                          .appliances[ind].name ==
                      "Refrigerator") {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/fri.png",
                            scale: 2,
                          ),
                          const Text(
                            'Refrigerator',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/fri.png",
                            scale: 2,
                          ),
                          const Text(
                            'Stove',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
