import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Porfile"),
        backgroundColor: Colors.blue,
      ),
      body: GestureDetector(
          onTap: () {
            context.go('/login');
          },
          child: Text("logout")),
    );
  }
}
