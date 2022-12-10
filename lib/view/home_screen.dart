import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_api/controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeScreenController(),
        ),
      ],
      child: Consumer<HomeScreenController>(
        builder: (context, controller, _) => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                onPressed: () async {
                  Phoenix.rebirth(context);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              const Spacer(flex: 2),
              Row(
                children: const [
                  SizedBox(width: 20),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
