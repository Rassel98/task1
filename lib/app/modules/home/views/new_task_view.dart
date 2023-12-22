import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/modules/home/controllers/home_controller.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Task"),
      ),
      body: SingleChildScrollView(

        child: Form(
          key: controller.formKeys,
          child: Column(
            children: [
              TextFormField(
                cursorColor: const Color(0xffff3333),
                keyboardType: TextInputType.text,
                controller: controller.titleController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Enter Task Title",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.9),
                        ))),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField(
                cursorColor: const Color(0xffff3333),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: controller.descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please write task title ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Enter Task Description",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.9),
                        ))),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: controller.isStatus.value,
                      checkColor: Colors.white,
                      activeColor: const Color(0xFFC81E26),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onChanged: (v) {
                        controller.isStatus(v);
                      }),
                  const Text(
                    'Status',
                    style: TextStyle(fontFamily: 'HindSiliguri', fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
