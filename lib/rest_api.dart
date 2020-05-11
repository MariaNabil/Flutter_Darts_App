import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'globals.dart' as globals;

//import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';

class URLS {
  static String ip = globals.ip;
  static String BASE_URL = 'http://$ip:5000';
}

class ApiService {
  /*static Future<List<dynamic>> getEmployees() async {
    // RESPONSE JSON :
    // [{
    //   "id": "1",
    //   "employee_name": "",
    //   "employee_salary": "0",
    //   "employee_age": "0",
    //   "profile_image": ""
    // }]

    final response = await http.get('${URLS.BASE_URL}/employees');
    if (response.statusCode == 200) {
      //print(response.body);
      print(json.decode(response.body)['data'].toString());
      return json.decode(response.body)['data'];
    } else {
      return null;
    }
  }*/

  static Future<bool> postEmptyDartBoard(_image) async {
    try {
      Dio dio = new Dio();
      dio.options.baseUrl = URLS.BASE_URL;
      //dio.options.connectTimeout = 5000; //5s
      //dio.options.receiveTimeout = 3000;
      //FormData formdata = new FormData(); // just like JS
      print('PATH');
      print(_image.path);
      FormData formData = new FormData.fromMap({
        "datBoard_image": await MultipartFile.fromFile(_image.path)

        // "file1": new UploadFileInfo(new File("./upload.jpg"), "upload1.jpg")
      });
      //var response = await dio.post("/info", data: formData);
      //formdata.add("photos", new UploadFileInfo(_image, basename(_image.path)));

      final response = await dio.post('/get_dart_board_image', data: formData);

      print('CODE : ' + response.statusCode.toString());
      if (response.statusCode == 200) {
        print('DATA : ');
        print(response.data);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  static Future<int> getScore(_image) async {
    try {
      Dio dio = new Dio();
      dio.options.baseUrl = URLS.BASE_URL;
      print('PATH');
      print(_image.path);
      FormData formData = new FormData.fromMap(
          {"dart_image": await MultipartFile.fromFile(_image.path)});
      print(formData);
      final response = await dio.post('/get_dart_score', data: formData);
      print('CODE : ' + response.statusCode.toString());
      if (response.statusCode == 200) {
        print('DATA : ');
        print(response.data);
        print(response.data['score']);
        return response.data['score'];
      } else {
        return -1;
      }
    } catch (error) {
      print(error);
      return -1;
    }
  }

  static Future<bool> getOutputImage() async {
    try {
      Dio dio = new Dio();
      dio.options.baseUrl = URLS.BASE_URL;
      final path = join(
        // Store the picture in the temp directory.
        // Find the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        'outputImage.jpg',
      );

      globals.outputImagePath = path;
      imageCache.clear();

      final response = await dio.download('/get_output_image', path);
      print('CODE : ' + response.statusCode.toString());
      if (response.statusCode == 200) {
        print('DATA : ');
        print(response.data);
        //print(response.data['score']);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
}
