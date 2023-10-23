import 'package:blood_donate_app/screens/editdonor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String selectedBloodGroup;
  late String nameController;
  late String areaController;

  late String dateController;
  loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emailController.clear();
      passwordController.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EditDonor()));
      print("=============== LoggedIn Successfully ===================");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print("=============== Catch ===================");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(
            Icons.water_drop,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          title: const Text(
            "ZINDAGI",
            textAlign: TextAlign.right,
          ),
        ),
        body: SafeArea(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const ListTile(
                title: Text(
                  "Log In",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter Email",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    loginUser();
                  },
                  child: const Text("Login"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red))),
              const SizedBox(
                height: 10,
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const SignUpView(),
              //       ),
              //     );
              //   },
              //   child: const Text(
              //     "Don't have already Account, Register here.",
              //     style: TextStyle(
              //       color: Colors.red,
              //     ),
              //   ),
              // ),
            ],
          ),
        ))));
  }
}
