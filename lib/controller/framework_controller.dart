import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'package:real_rest_api_getx_flutter/model/framework.dart';
import 'package:real_rest_api_getx_flutter/repository/framework_repository.dart';

class FrameworkController extends GetxController {
  List<Framework> frameworks = [];
  Framework selectedFramework;

  FrameworkRepository repository = FrameworkRepository();
  static FrameworkController get to => Get.find<FrameworkController>();

  fetchAllFramework() async {
    frameworks = await repository.fetchAllFrameworks();
    update();
  }

  // Future<List<Framework>>  fetchFramework(int id) async {
  //   return await repository.fetchFramework(id);
  //   update();
  // }

  addFramework(Framework framework) async {
    frameworks.add(await repository.addFramework(framework));
    update();
  }

  deleteFramework(int id) async {
    Response response = await repository.deleteFramework(id);
    if (response.data['code'] == null) {
      frameworks.removeWhere((e) => e.id == id);
      update();
    }
  }

  updateFramework(int id, Framework framework) async {
    Response response = await repository.updateFramework(id, framework);
    if (response.data['code'] == null) {
      int index = frameworks.indexWhere((e) => e.id == id);
      frameworks[index] = Framework.fromJson(response.data);
      update();
    }
  }

  setSelected(Framework framework) {
    selectedFramework = framework;
    update();
  }

  clearSelected() {
    selectedFramework = null;
    update();
  }
}
