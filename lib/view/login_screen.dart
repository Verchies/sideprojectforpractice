import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_api/controllers/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginScreenController(),
        ),
      ],
      child: Consumer<LoginScreenController>(
        builder: (context, controller, _) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                TextField(
                  controller: controller.passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var route = await controller.login(context);
                    if (!mounted) return;
                    if (route != null) {
                      Navigator.push(context, route);
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
