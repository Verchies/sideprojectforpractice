import 'package:flutter/material.dart';
import 'package:todo_app_api/API/appdatas.dart';

class RegisterScreenController with ChangeNotifier {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  register() async {
    try {
      final response = await ApiBase.dioClient.postRequest(
          path: '/kayit.php',
          body: {'name': nameController.text, 'email': emailController.text, 'password': passwordController.text});
      if (response.data['success']) {
        debugPrint(response.data.toString());
      } else {
        debugPrint(response.statusMessage);
      }
    } on Exception catch (e) {
      debugPrint('Error: $e');
    }
  }
}
