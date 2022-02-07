// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tut/homepage_controller.dart';

void main() {
  runApp(const MyApp());
}

// Getview == StatelessWidget

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//Getx Dependency add korlam
class MyHomePage extends GetView {
  var homePageController = Get.put(HomepageControlelr());

  MyHomePage({Key? key})
      : super(key: key); //initiating controller for the first time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterOne(), //Counter One Widget Shows text
          const SizedBox(
            // Spacer
            height: 20,
            width: double.infinity,
          ),
          ElevatedButton(
              // Button
              onPressed: () {
                Get.to(() =>
                    ThirdPage()); // Nvigate to another Page without passing any Value
              },
              child: const Text("Next Page"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homePageController
              .increment(); //acces the method inside the controller
        },
      ),
    );
  }
}

class CounterOne extends StatelessWidget {
  // this widget Shows in the first page
  CounterOne({
    Key? key,
  }) : super(key: key);

  final HomepageControlelr homePageController =
      Get.find<HomepageControlelr>(); //we are accessing the controller here

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          homePageController.value.value.toString(),
          textAlign: TextAlign.center,
        ));
  }
}

class ThirdPage extends GetView {
  // we Navigate to this Page from First Page without Taking any parameter..
  final HomepageControlelr homePageController =
      Get.find<HomepageControlelr>(); //we are accessing the controller here

  ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
            child: Text(
              homePageController.value.value.toString(),
            ),
          )),
    );
  }
}
