import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_api/controllers/login_screen_controller.dart';
import 'package:todo_app_api/view/register_screen.dart';

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
          body: Column(
            children: [
              const Spacer(flex: 2),
              Row(
                children: const [
                  SizedBox(width: 20),
                  Text(
                    'Login',
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
                      onPressed: () async {
                        var route = await controller.login(context);
                        if (!mounted) return;
                        if (route != null) {
                          Navigator.push(context, route);
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen())),
                child: const Text(
                  'You don\'t have account? Register.',
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
