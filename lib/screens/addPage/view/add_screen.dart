import 'package:expense_manager/screens/navigationPage/controller/navigation_controller.dart';
import 'package:expense_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  NavigationController controller = Get.put(NavigationController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future(() => controller.inch());
  }

  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtcate = TextEditingController();
  TextEditingController txtNotes = TextEditingController();
  TextEditingController txtTags = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          titleSpacing: 2,
          title: Text("Add Category"),
          backgroundColor: Color(0xff2e2c4d),
          actions: [
            DropdownButton(
              hint: Text("${controller.dropDown.value}",
                  style: TextStyle(color: Colors.white)),
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
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
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        controller.date = (await showDatePicker(
                            context: context,
                            initialDate: controller.currentDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030)))!;

                        controller.changeDate(controller.date);
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => Text(
                        "${controller.day.value}/${controller.mon.value}/${controller.year.value}",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  height: 1,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        controller.time = (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                                hour: controller.currentTime.hour,
                                minute: controller.currentTime.minute)))!;

                        controller.changeTime(controller.time);
                      },
                      icon: Icon(Icons.access_time_filled_rounded),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => Text(
                        "${controller.hour.value}:${controller.minute.value}",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    "Amount",
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtAmount,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    prefixIcon: Icon(Icons.currency_rupee, color: Colors.black),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calculate, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "          Category",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: Icon(Icons.more_horiz, color: Colors.white),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Obx(
                      () => Text(
                        "${controller.inClick.value}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          content: ShowDialogCate(),
                          backgroundColor: Color(0xff2e2c4d),
                          title: "Categories",
                          titleStyle:
                              TextStyle(fontSize: 25, color: Colors.white),
                        );
                      },
                      icon: Icon(Icons.keyboard_arrow_down_rounded),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  height: 1,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "          Payment mode",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.payment_rounded),
                    SizedBox(
                      width: 15,
                    ),
                    Obx(
                      () => Text(
                        "${controller.onclick.value}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          content: ShowDialogPayType(),
                          backgroundColor: Color(0xff2e2c4d),
                          title: "Payment Mode",
                          titleStyle:
                              TextStyle(fontSize: 25, color: Colors.white),
                        );
                      },
                      icon: Icon(Icons.keyboard_arrow_down_rounded),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  "Other details",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: txtNotes,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Notes",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.notes_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var date =
                "${controller.currentDate.day}/${controller.currentDate.month}/${controller.currentDate.year}";
            var time =
                "${controller.currentTime.hour}:${controller.currentTime.minute}";
            DBHelper.dbHelper.insertDB(
                amount: txtAmount.text,
                notes: txtNotes.text,
                status: controller.dropDown.value,
                date: date,
                time: time,
                category: controller.inClick.value,
                payTypes: controller.onclick.value);
            controller.readData();
            Get.back();
          },
          backgroundColor: Color(0xff2e2c4d),
          child:
              Icon(Icons.account_balance_wallet_rounded, color: Colors.white),
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
