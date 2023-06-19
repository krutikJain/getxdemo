import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Controllers/ControllerCustom.dart';
import 'package:getxdemo/ScreenTwo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ControllerCustom custom = Get.put(ControllerCustom());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("GetX Demo"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: const Text("GetX Dialog Demo"),
                    onTap: () {
                      Get.defaultDialog(
                        title: "GetX Dialog",
                        content: const Text("Do You Want To Close This Dialog?"),
                        textConfirm: "Yes",
                        textCancel: "No",
                        onConfirm: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: const Text("GetX BottomSheet Demo"),
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.changeTheme(ThemeData.light());
                                    },
                                    child: const Text("Light Mode")),
                              ),
                              Container(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.changeTheme(ThemeData.dark());
                                    },
                                    child: const Text("Dark Mode")),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: Obx(() => Text(
                    custom.count.toString(),
                    style: const TextStyle(fontSize: 50),
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 50,
              width: double.infinity,
              child: FilledButton(onPressed: (){
                    Get.to(const ScreenTwo());
              }, child: const Text("Sceen 2",style: TextStyle(fontSize: 18),),),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.ads_click_outlined),
              onPressed: () {
                Get.snackbar("GetX", "GetX SnackBar Demo",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(15));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                custom.Increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
