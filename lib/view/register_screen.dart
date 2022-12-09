import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_api/controllers/register_screen_controller.dart';
import 'package:todo_app_api/view/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterScreenController(),
        ),
      ],
      child: Consumer<RegisterScreenController>(
        builder: (context, controller, _) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                ),
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
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: controller.register,
                      child: const Text('Register'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                      child: const Text('you have account? Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
