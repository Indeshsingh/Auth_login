import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/auth_bloc.dart';
import 'package:login/screens/auth_screen/login_page.dart';
import 'package:lottie/lottie.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SignupPage"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isAuthenticated) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Account successfully created")));
            } else if (state.errormessage.isNotEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errormessage)));
            }
          },
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Lottie.asset(
                          'assets/lotties/Animation - 1737452228087.json')),
                  Text(
                    "Create An Account",
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
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: "Confirm Password",
                        border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.black)),
                      onPressed: () {
                        final email = emailController.text;
                        final password = passwordController.text;
                        final confirmpassword = confirmPasswordController.text;

                        if (password == confirmpassword) {
                          context
                              .read<AuthBloc>()
                              .add(AuthSignupEvent(email, password));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Password do not match")));
                        }
                      },
                      child: Text("Sign up",
                          style: TextStyle(color: Colors.white))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 3),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
        ));
  }
}
