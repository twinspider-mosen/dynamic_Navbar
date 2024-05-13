import 'package:custom_navbar/controller/mainController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: GetBuilder(
        init: MainController(),
        builder: (controller) {
          return ListView.builder(
              itemCount: controller.cartList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.cartList[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.remove,
                    ),
                    onPressed: () {
                      controller.removeItem(controller.cartList[index]);
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
