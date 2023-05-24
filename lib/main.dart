
import 'package:expense_manager/screens/addPage/view/add_screen.dart';
import 'package:expense_manager/screens/dateWiseFilter/view/dateWise_screen.dart';
import 'package:expense_manager/screens/filterPage/view/filter_screen.dart';
import 'package:expense_manager/screens/homePage/view/home_screen.dart';
import 'package:expense_manager/screens/navigationPage/view/navigation_screen.dart';
import 'package:expense_manager/screens/payTypesFilter/view/payTypes_screen.dart';
import 'package:expense_manager/screens/splash/view/splash_screen.dart';
import 'package:expense_manager/screens/transactionPage/view/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/add',
      getPages: [
        GetPage(name: '/', page:() => splashScreen()),
        GetPage(name: '/add', page:() => AddScreen()),
        GetPage(name: '/navigation', page:() =>  NavigationScreen()),
        GetPage(name: '/home', page:() =>  HomeScreen()),
        GetPage(name: '/transaction', page:() =>  TransactionScreen()),
        GetPage(name: '/filter', page:() =>  FilterScreen()),
        GetPage(name: '/date', page:() =>  DatewiseScreen()),
        GetPage(name: '/paytype', page:() =>  PaytypesScreen()),
      ],
    ),
  );
}