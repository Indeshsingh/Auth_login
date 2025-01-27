import 'package:flutter/material.dart';
import 'package:login/bloc/auth_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/screens/home/navbar_screen.dart';
import 'package:lottie/lottie.dart';

import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Loginpage"),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NavbarScreen()));
          } else if (state.errormessage.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errormessage)));
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Lottie.asset(
                          'assets/lotties/Animation - 1737449284568.json')),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: "Password",
                        border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.black)),
                      onPressed: () {
                        final email = emailController.text;
                        final password = passwordController.text;
                        context
                            .read<AuthBloc>()
                            .add(AuthLoginEvent(email, password));
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.white))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont't have an account?"),
                      SizedBox(width: 3),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
