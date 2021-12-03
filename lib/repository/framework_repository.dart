import 'package:dio/dio.dart';
import 'package:real_rest_api_getx_flutter/api/client.dart';
import 'package:real_rest_api_getx_flutter/api/framework_api.dart';
import 'package:real_rest_api_getx_flutter/model/framework.dart';

class FrameworkRepository {
  Dio apiClient;
  // or database
  // or shared preference

  FrameworkRepository() {
    apiClient = client();
    // initialize other source if needed
  }

  Future<List<Framework>> fetchAllFrameworks() async {
    Response response = await fetchAll(apiClient);

    return List<Framework>.from(
        (response.data).map((json) => Framework.fromJson(json)));
  }

  Future<List<Framework>> fetchFramework(int id) async {
    Response response = await fetch(apiClient, id);
    return List<Framework>.from(
        (response.data).map((json) => Framework.fromJson(json)));
  }

  Future<Framework> addFramework(Framework framework) async {
    Response response = await add(apiClient, framework.toJson());
    return Framework.fromJson(response.data);
  }

  Future<Response> deleteFramework(int id) async {
    return await delete(apiClient, id);
  }

  Future<Response> updateFramework(int id, Framework framework) async {
    return await update(apiClient, id, framework.toJson());
  }
}
