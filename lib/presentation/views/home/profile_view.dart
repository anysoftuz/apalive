import 'package:apalive/app/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        children: [
          ListTile(title: const Text('Password'), onTap: () {}),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              context.read<AuthBloc>().add(LogOutEvent());
            },
          ),
        ],
      ),
    );
  }
}
