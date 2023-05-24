import 'package:expense_manager/screens/dateWiseFilter/view/dateWise_screen.dart';
import 'package:expense_manager/screens/payTypesFilter/view/payTypes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Filter"),
            backgroundColor: Color(0xff13232e),
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 17),
              dividerColor: Colors.white,
              tabs: [
                Tab(text: "Date"),
                Tab(text: "Payment Mode"),
              ],
            ),
          ),
          body: TabBarView(
            children: [DatewiseScreen(), PaytypesScreen()],
          ),
        ),
      ),
    );
  }
}
