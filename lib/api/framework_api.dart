import 'package:dio/dio.dart';

Future<Response> fetchAll(Dio dio) {
  return dio.get('/get-all-data');
}

Future<Response> fetch(Dio dio, int id) {
  return dio.get('/get-data/$id');
}

Future<Response> add(Dio dio, Map<String, dynamic> data) {
  return dio.post('/add-data', data: data);
}

Future<Response> delete(Dio dio, int id) {
  return dio.delete('/delete-data/$id');
}

Future<Response> update(Dio dio, int id, Map<String, dynamic> data) {
  return dio.put('/edit-data/$id', data: data);
}
