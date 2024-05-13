import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  SharedPreferences? sp;
  // initsp() async {
  //   await SharedPreferences.getInstance().then((value) {
  //     value.setStringList('cartList', cartList);
  //   });
  // }

  int selectedIndex = 0;
  List<String> cartList = [];
  List<String> itemList = [
    "Item 1",
    "Item 2",
    "Item 4",
    "Item 61",
    "Item 8",
    "Item 23",
    "Item 100",
  ];

  List<String> favList = [];
  changePage(int nextPage) {
    selectedIndex = nextPage;
    update();
  }

  getCartItems() async {
    await SharedPreferences.getInstance().then((value) {
      cartList = value.getStringList('cartList')!;
    });
    update();
  }

  addToCart(String index) async {
    cartList.add(index);
    await SharedPreferences.getInstance().then((value) {
      value.setStringList('cartList', cartList);
    });
    update();
  }

  removeItem(String item) async {
    await SharedPreferences.getInstance().then((value) {
      cartList.remove(item);
      value.setStringList('cartList', cartList);
    }).then((value) {
      getCartItems();
    });
    update();
  }

  clearCart() async {
    await SharedPreferences.getInstance().then((value) {
      value.setStringList('cartList', []);
      cartList.clear();
    });
    update();
  }

  addToFav(String index) {
    favList.add(index);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartItems();
  }
}
