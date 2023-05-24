import 'dart:async';

import 'package:expense_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxString stuts="".obs;
  int i = 0;
  RxList<Map> TransactionList = <Map>[].obs;
  RxString inClick = "".obs;
  RxString onclick = "".obs;
  RxString dropDown = "Income".obs;
  RxInt Income = 0.obs;
  RxInt Expense = 0.obs;
  RxInt total = 0.obs;

  RxList categories = [
    "Salary",
    "Food an Dining",
    "Shopping",
    "Travelling",
    "Entertainment",
    "Medical",
    "Personal Care",
    "Education",
    "Bills and Utilities",
    "Investments",
    "Rent",
    "Taxes",
    "Insurance",
    "Gifts and Donation",
    "Coupans",
    "Sold items"
  ].obs;

  RxList payTypes = ["online", "debit card", "credit card", "offline"].obs;

  void changeScreen(int value) {
    i = value;
    update();
  }

  void changeCategory(String category) {
    inClick.value = category;
  }

  void changePaytypes(String paytypes) {
    onclick.value = paytypes;
  }

  var currentDateFrom = DateTime.now();
  var From = DateTime.now();
  RxInt fromDay = 0.obs;
  RxInt fromMonth = 0.obs;
  RxInt fromYear = 0.obs;

  void inch1() {
    currentDateTo = DateTime.now();
    currentDateFrom = DateTime.now();
    changeFromDate(currentDateFrom);
    changeToDate(currentDateTo);
  }

  void changeFromDate(From) {
    currentDateFrom = From;
    fromDay.value = currentDateFrom.day;
    fromMonth.value = currentDateFrom.month;
    fromYear.value = currentDateFrom.year;
    update();
  }

  var currentDateTo = DateTime.now();
  var To = DateTime.now();
  RxInt toDay = 0.obs;
  RxInt toMonth = 0.obs;
  RxInt toYear = 0.obs;

  void changeToDate(To) {
    currentDateTo = To;
    toDay.value = currentDateTo.day;
    toMonth.value = currentDateTo.month;
    toYear.value = currentDateTo.year;
    update();
  }

  RxInt day = 0.obs;
  RxInt mon = 0.obs;
  RxInt year = 0.obs;
  RxInt hour = 0.obs;
  RxInt minute = 0.obs;

  var currentDate = DateTime.now();
  var date = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  TimeOfDay time = TimeOfDay.now();

  void inch() {
    currentDate = DateTime.now();
    changeDate(currentDate);
  }

  void changeDate(date) {
    currentDate = date;
    day.value = currentDate.day;
    mon.value = currentDate.month;
    year.value = currentDate.year;
    update();
  }

  void changeTime(time) {
    currentTime = time;
    hour.value = currentTime.hour;
    minute.value = currentTime.minute;
    update();
  }

  Future<void> readData() async {
    TransactionList.value = await DBHelper.dbHelper.readDB();
    Timer(
      Duration(seconds: 1),
      () {
        rupees();
      },
    );
  }

  Future<void> filterRead({statusCode}) async {
    TransactionList.value =
        await DBHelper.dbHelper.filterReadDB(status: statusCode);
  }

  Future<void> dateWise({from,to,status,paytype})
  async {
    print(status);
    TransactionList.value = await DBHelper.dbHelper.allFilterRead(payTypes: paytype,fromDate: from, toDate: to,status: status);
  }

  Future<void> allFilterRead({fromDate, toDate, payTypes, status}) async {
    TransactionList.value = await DBHelper.dbHelper.allFilterRead(
        fromDate: fromDate, toDate: toDate, status: status, payTypes: payTypes);
    print(TransactionList.value);
  }

  void updateData(
      {required amount,
      required id,
      required notes,
      required category,
      required payTypes,
      required status}) {
    DBHelper.dbHelper.updateDB(
        amount: amount,
        id: id,
        notes: notes,
        category: category,
        payTypes: payTypes,
        status: status);

    readData();
  }

  Future<void> deleteData(id) async {
    DBHelper.dbHelper.deleteDB(id: id);
    readData();
  }

  void rupees() {
    for (int i = 0; i < TransactionList.length; i++) {
      if (TransactionList[i]['status'] == 'Income') {
        Income.value = Income.value + int.parse(TransactionList[i]['amount']);
      } else {
        Expense.value = Expense.value + int.parse(TransactionList[i]['amount']);
      }
    }
    total.value = Income.value - Expense.value;
  }
}
