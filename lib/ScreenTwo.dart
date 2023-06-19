import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Controllers/ListController.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  TextEditingController textEditingController = TextEditingController();
  ListController listController = Get.put(ListController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GetX Favourite List"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Enter New Item",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
                controller: textEditingController,
                onFieldSubmitted: (val) {
                  listController.addList(val);
                  textEditingController.clear();
                },
              ),
            ),
            Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: listController.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        listController.fav.contains(index)
                            ? listController.removeList(index)
                            : listController.addFav(index);
                      },
                      title: Text(listController.list[index].toString()),
                      trailing: Obx(
                        () => listController.fav.contains(index)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_outline),
                      ));
                }))
          ],
        ),
      ),
    );
  }
}
