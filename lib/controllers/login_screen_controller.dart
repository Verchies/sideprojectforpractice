import 'package:flutter/material.dart';
import 'package:todo_app_api/API/appdatas.dart';
import 'package:todo_app_api/view/home_screen.dart';

class LoginScreenController with ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<Route?> login(BuildContext context) async {
    try {
      final response = await ApiBase.dioClient
          .postRequest(path: '/login.php', body: {'email': emailController.text, 'password': passwordController.text});
      if (response.data['success']) {
        debugPrint(response.data.toString());
        Route route = MaterialPageRoute(builder: (context) => const HomeScreen());
        return route;
      } else {
        debugPrint(response.statusMessage);
        return null;
      }
    } on Exception catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
