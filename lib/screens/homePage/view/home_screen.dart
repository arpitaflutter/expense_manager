import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigationPage/controller/navigation_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavigationController controller = Get.put(NavigationController());

  TextEditingController txtamount = TextEditingController();
  TextEditingController txtnotes = TextEditingController();
  TextEditingController txtcate = TextEditingController();
  TextEditingController txtpaymode = TextEditingController();
  TextEditingController txtstatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Arpita Mangukiya",
                          style: TextStyle(fontSize: 28),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "A",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Row(
                  children: [
                    Text(
                      "This Month",
                      style: TextStyle(fontSize: 19),
                    ),
                    Spacer(),
                    Icon(Icons.search, size: 30),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.red,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.red.shade200,
                                shape: BoxShape.circle),
                            child:
                                Icon(Icons.arrow_upward, color: Colors.white),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Spending",
                                style: TextStyle(color: Colors.red.shade200),
                              ),
                              Obx(
                                () => Text(
                                  "Rs.${controller.Expense.value}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.green.shade200,
                                shape: BoxShape.circle),
                            child:
                                Icon(Icons.arrow_downward, color: Colors.white),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Income",
                                style: TextStyle(color: Colors.green.shade200),
                              ),
                              Obx(
                                () => Text(
                                  "Rs.${controller.Income.value}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          "Balance: Rs.${controller.total.value}",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(fontSize: 19),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/transaction');
                      },
                      child: Text("See all"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: controller.TransactionList[index]
                                            ['status'] ==
                                        "Income"
                                    ? Colors.green.shade100
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: Offset(1, 2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 83,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(1, 2),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${controller.TransactionList[index]['payTypes']}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 40,
                                            width: 83,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(1, 2),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${controller.TransactionList[index]['status']}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        "INR ${controller.TransactionList[index]['amount']}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${controller.TransactionList[index]['category']}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Column(
                                    children: [
                                      Text(
                                        "${controller.TransactionList[index]['date']}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              txtcate.text =
                                                  controller.inClick.value;
                                              txtnotes.text = controller
                                                      .TransactionList[index]
                                                  ['notes'];
                                              txtamount.text = controller
                                                      .TransactionList[index]
                                                  ['amount'];
                                              txtstatus.text =
                                                  controller.dropDown.value;
                                              txtpaymode.text =
                                                  controller.onclick.value;

                                              var id = controller
                                                      .TransactionList[index]
                                                  ['id'];

                                              updateDialog(id);
                                            },
                                            icon: Icon(Icons.edit,
                                                color: Colors.grey.shade700),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              var id = controller
                                                      .TransactionList[index]
                                                  ['id'];
                                              controller.deleteData(id);
                                              controller.readData();
                                            },
                                            icon: Icon(Icons.delete,
                                                color: Colors.red.shade300),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: controller.TransactionList.length,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Text(
                      "Monthly Budget",
                      style: TextStyle(fontSize: 19),
                    ),
                    Spacer(),
                    Text("Add budget"),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/img_2.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "No budgets set!",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Set up a budget to help you stay on",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "track with your expenses.",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Text(
                      "Upcoming reminders",
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add_circle,
                      color: Color(0xff2e2c4d),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/reminder.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "No reminders set!",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Add a reminder to remind you for an",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "expense later or set recurring reminders for",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "the recurring expenses.",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Follow us",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "We post regularly about personal finance ,budgeting\nand investing."),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/instagram.png",
                      height: 30,
                      width: 30,
                      color: Color(0xff2e2c4d),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/images/twitter.png",
                      height: 40,
                      width: 40,
                      color: Color(0xff2e2c4d),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/images/facebook.png",
                      height: 30,
                      width: 30,
                      color: Color(0xff2e2c4d),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateDialog(id) {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "Edit Data",
      titleStyle: TextStyle(color: Colors.black, fontSize: 20),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: DropdownButton(
                hint: Obx(
                      () => Text("${controller.dropDown.value}",
                      style: TextStyle(color: Colors.black)),
                ),
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                items: <String>["Income", "Expense"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    controller.dropDown.value = newValue!;
                  });
                },
              ),
            ),
            Row(
              children: [
                Text(
                  "Category",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      content: ShowDialogCate(),
                      backgroundColor: Color(0xff2e2c4d),
                      title: "Categories",
                      titleStyle: TextStyle(fontSize: 25, color: Colors.white),
                    );
                  },
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Obx(() => Text("${controller.inClick.value}",
                style: TextStyle(color: Colors.black))),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              ),
            ),
            Row(
              children: [
                Text(
                  "Payment Mode",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      content: ShowDialogPayType(),
                      backgroundColor: Color(0xff2e2c4d),
                      title: "Payment Mode",
                      titleStyle: TextStyle(fontSize: 25, color: Colors.white),
                    );
                  },
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Obx(() => Text("${controller.onclick.value}",
                style: TextStyle(color: Colors.black))),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              ),
            ),
            TextField(
              controller: txtamount,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.currency_rupee,
                    color: Colors.black,
                  ),
                  hintText: "Amount"),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: txtnotes,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(
                  Icons.currency_rupee,
                  color: Colors.black,
                ),
                hintText: "Notes",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  controller.updateData(
                      id: id,
                      amount: txtamount.text,
                      notes: txtnotes.text,
                      category: controller.inClick.value,
                      payTypes: controller.onclick.value,
                      status: controller.dropDown.value);
                  Get.back();
                },
                child: Text("Edit",style: TextStyle(fontSize: 17)),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xff2e2c4d)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ShowDialogCate() {
    return Container(
      width: 200,
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        controller.changeCategory(controller.categories[index]);
                        Get.back();
                      },
                      child: Obx(
                            () => Text(
                          "${controller.categories[index]}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: controller.categories.length,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                backgroundColor: Colors.white,
                title: "Add the category",
                titleStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                content: categoryDialog(),
              );
            },
            child: Text(
              "Add Category",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget categoryDialog() {
    return Column(
      children: [
        TextField(
          controller: txtcate,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Category"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            controller.categories.add(txtcate.text);
            Get.back();
          },
          child: Text("Add"),
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff2e2c4d)),
        ),
      ],
    );
  }

  Widget ShowDialogPayType() {
    return Container(
      height: 200,
      width: 150,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                controller.changePaytypes(controller.payTypes[index]);
                Get.back();
              },
              child: Text(
                "${controller.payTypes[index]}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
        itemCount: controller.payTypes.length,
      ),
    );
  }
}
