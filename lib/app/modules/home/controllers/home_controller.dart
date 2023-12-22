import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_app/app/data/models/task_model.dart';
import '../../../data/db_helper/local_db_helper.dart';

class HomeController extends GetxController {
  RxBool isStatus = false.obs;
  RxBool isLoading = true.obs;

  GlobalKey<FormState> formKeys = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _taskList = <TaskModel>[].obs;
  List<TaskModel> get getTaskList => _taskList;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      isLoading(false);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    LocalDBHelper.instance.close();
  }
}
