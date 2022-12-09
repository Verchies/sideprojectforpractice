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
          body: Column(
            children: [
              const Spacer(flex: 2),
              Row(
                children: const [
                  SizedBox(width: 20),
                  Text(
                    'Register',
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black12,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(height: 15),
                    TextField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: controller.register,
                      child: const Text('Register'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                child: const Text(
                  'You have an account already? Login.',
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
