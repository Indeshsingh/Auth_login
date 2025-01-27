import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Optional: Navigate to a different screen after logout
        if (!state.isAuthenticated) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutEvent());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          children: const [
            Center(
              child: Text("Welcome to your profile!"),
            ),
          ],
        ),
      ),
    );
  }
}
