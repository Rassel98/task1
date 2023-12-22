import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.getTaskList.isEmpty
              ? const Center(
                  child: Text("No Data Found"),
                )
              : ListView.builder(
                  itemCount: controller.getTaskList.length,
                  itemBuilder: (context, index) {
                    final model = controller.getTaskList[index];
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffD4D5D6).withOpacity(0.7),
                                spreadRadius: 0,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                            RichText(
                              text: TextSpan(
                                text: 'Title : ',
                                style: const TextStyle(fontSize: 16, fontFamily: 'muli', fontWeight: FontWeight.w600, color: Color(0xFF404144)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "task title",
                                    style:
                                        const TextStyle(fontFamily: 'HindSiliguri', fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Description : ',
                                style: const TextStyle(fontSize: 16, fontFamily: 'muli', fontWeight: FontWeight.w600, color: Color(0xFF404144)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "task description jdkgznkdgd gfdigfd gifdg fdgfdujgfd gfdujfd gdfjgfd gj",
                                    style:
                                        const TextStyle(fontFamily: 'HindSiliguri', fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: TextButton(
                            // onPressed: () => Get.to(
                            //       () =>  UpdateShopUser(userProfile: model,),
                            //   transition: Transition.leftToRight,
                            //   duration: const Duration(milliseconds: 360),
                            //   curve: Curves.easeInOut,
                            // ),
                            onPressed: () => print,
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(40, 20)),
                              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.pinkAccent, width: 1.5),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              )),
                            ),
                            child: const Text('Edit', style: TextStyle(fontFamily: 'muli', fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    );
                  },
                )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print,
        child: Icon(Icons.add),
      ),
    );
  }
}
