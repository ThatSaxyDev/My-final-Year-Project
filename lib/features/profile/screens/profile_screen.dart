import 'package:flutter/material.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        title: const TTinterfacesText(
          text: 'My Profile',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            
          ],
        ),
      ),
    );
  }
}
