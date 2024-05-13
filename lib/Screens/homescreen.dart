import 'package:custom_navbar/controller/mainController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> itemList = [
  //   "Item 1",
  //   "Item 2",
  //   "Item 4",
  //   "Item 61",
  //   "Item 8",
  //   "Item 23",
  //   "Item 100",
  // ];
  // List<String> cartList = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(title: Text("Home")),
            body: ListView.builder(
                itemCount: controller.itemList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.itemList[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.shopping_basket),
                      onPressed: () async {
                        // controller.clearCart;
                        if (!controller.cartList
                            .contains(controller.itemList[index])) {
                          controller.addToCart(controller.itemList[index]);
                        }
                        print(controller.cartList);
                      },
                    ),
                  );
                }),
          );
        });
  }
}
