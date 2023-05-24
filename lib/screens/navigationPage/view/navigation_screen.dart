import 'package:expense_manager/screens/navigationPage/controller/navigation_controller.dart';
import 'package:expense_manager/screens/transactionPage/view/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../filterPage/view/filter_screen.dart';
import '../../homePage/view/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
            backgroundColor: Color(0xff2e2c4d),
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: SafeArea(
            child: IndexedStack(
              index: controller.i,
              children: [
                HomeScreen(),
                TransactionScreen(),
                FilterScreen()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff2e2c4d),
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(color: Color(0xff2e2c4d),),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            iconSize: 30,
            onTap: (value) {
              controller.changeScreen(value);
            },
            currentIndex: controller.i,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.graphic_eq), label: "Transactions"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.filter_alt_rounded), label: "Filter"),
            ],
          ),
        );
      },
    );
  }
}
