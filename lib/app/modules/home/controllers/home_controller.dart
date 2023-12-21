import 'package:get/get.dart';

import '../../../data/db_helper/local_db_helper.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
