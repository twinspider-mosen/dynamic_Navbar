import 'package:custom_navbar/Screens/cartScreen.dart';
import 'package:custom_navbar/Screens/favScreen.dart';
import 'package:custom_navbar/Screens/homescreen.dart';
import 'package:custom_navbar/Screens/profileScreen.dart';
import 'package:custom_navbar/controller/mainController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  final List<Widget> screenList = [
    HomePage(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            body: screenList.elementAt(controller.selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: Colors.blue,
              // backgroundColor: Colors.black,
              selectedLabelStyle: TextStyle(color: Colors.blue),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.blue,
                    size: 32,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Stack(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.blue,
                          size: 32,
                        ),
                        controller.cartList.isEmpty
                            ? Container(
                                height: 0,
                                width: 0,
                              )
                            : Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.red),
                                  child: Center(
                                      child: Text(
                                    controller.cartList.length.toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                      ],
                    ),
                    label: "Cart"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.blue,
                      size: 32,
                    ),
                    label: "Favourite"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 32,
                    ),
                    label: "Profile")
              ],
              currentIndex: selectedIndex,
              onTap: (nextScreen) {
                controller.changePage(nextScreen);
              },
            ),
          );
        });
  }
}
