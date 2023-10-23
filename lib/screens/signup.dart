import 'package:blood_donate_app/screens/end.dart';
import 'package:blood_donate_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController areaController = TextEditingController();
  String selectedBloodGroup = "";
  TextEditingController dateController = TextEditingController();

  registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print("=============== Registerd Successfully ===================");
      emailController.clear();
      passwordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DetailsRegister(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
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
          toolbarHeight: 50,
          backgroundColor: Colors.red,
          centerTitle: true,
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
                    "Sign Up",
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
                      registerUser();
                    },
                    child: const Text(
                      "Register",
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red))),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  child: const Text(
                    "Do you have already Account, Login here.",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

class DetailsRegister extends StatefulWidget {
  const DetailsRegister({super.key});

  @override
  State<DetailsRegister> createState() => _DetailsRegisterState();
}

class _DetailsRegisterState extends State<DetailsRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String selectedBloodGroup = '';

  List<String> bloodGroups = ['A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-'];
  void selectBloodGroup(String bloodGroup) {
    setState(() {
      selectedBloodGroup = bloodGroup;
    });
  }

  void navigateToNextPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NextPage(
          selectedBloodGroup,
          nameController.text,
          areaController.text,
          dateController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.red,
          // centerTitle: true,
          title: const Text(
            "Donor Detail",
            textAlign: TextAlign.right,
          ),
        ),
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(children: [
                      const ListTile(
                        title: Text(
                          "Full Name",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: "Type Your Name",
                        ),
                      ),

                      // const SizedBox(
                      //   height: 2,
                      // ),
                      const ListTile(
                        title: Text(
                          "Area",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      TextField(
                        controller: areaController,
                        decoration: const InputDecoration(
                          hintText: "Type Area",
                        ),
                      ),

                      const ListTile(
                        title: Text(
                          "Last Donation Month",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      TextField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          hintText: "Enter Month",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Text(
                          'Blood Group Selection',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Text('Select a Blood Group:'),
                            // SizedBox(height: 20),
                            Wrap(
                              spacing: 30,
                              children: bloodGroups.map((String bloodGroup) {
                                return Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        selectBloodGroup(bloodGroup),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        selectedBloodGroup == bloodGroup
                                            ? Colors.red
                                            : Color.fromARGB(255, 21, 10, 9),
                                      ),
                                    ),
                                    child: Text(bloodGroup),
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              height: 70,
                              width: 180,
                              child: ElevatedButton(
                                onPressed: selectedBloodGroup.isNotEmpty
                                    ? navigateToNextPage
                                    : null,
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.red))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                                child: Text(
                                  "SAVE",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // DropdownButton<String>(
                      //   value: selectedBloodGroup,
                      //   items: bloodGroups.map((String bloodGroup) {
                      //     return DropdownMenuItem<String>(
                      //       value: bloodGroup,
                      //       child: Text(bloodGroup),
                      //     );
                      //   }).toList(), // Move .toList() here
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       selectedBloodGroup = newValue!;
                      //     });
                      //   },
                      // ),
                      // const SizedBox(height: 20),
                      // ElevatedButton(
                      //     onPressed: navigateToNextPage,
                      //     child: const Text('SAVE'),
                      //     style: ButtonStyle(
                      //         backgroundColor: MaterialStateProperty.all<Color>(
                      //             Colors.red))),
                    ])))));
  }
}

class NextPage extends StatelessWidget {
  final String selectedBloodGroup;
  final String nameController;
  // final String phoneController;

  final String areaController;
  final String dateController;

  NextPage(this.selectedBloodGroup, this.nameController, this.areaController,
      this.dateController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            "ZINDAGI",
            textAlign: TextAlign.right,
          ),
        ),
        body: Container(
          child: Column(children: [
            ListTile(
              leading: const Text(
                'Name : ',
                style: TextStyle(color: Colors.red),
              ),
              title: Text(
                ' $nameController',
                // style: TextStyle(fontSize: 10),
              ),
            ),
            ListTile(
              leading: const Text(
                'Area : ',
                style: TextStyle(color: Colors.red),
              ),
              title: Text(
                ' $areaController',
                // style: TextStyle(fontSize: 10),
              ),
            ),
            ListTile(
              leading: const Text(
                'Last Donation Month : ',
                style: TextStyle(color: Colors.red),
              ),
              title: Text(
                ' $dateController',
                // style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ListTile(
              leading: const Text(
                'Selected Blood Group :',
                style: TextStyle(color: Colors.red),
              ),
              // title: Text(
              //   ' $selectedBloodGroup',
              //   // style: TextStyle(fontSize: 10),
              // ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("$selectedBloodGroup"),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
              ),
            ),
            SizedBox(
              height: 500,
            ),
            SizedBox(
              height: 70,
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const End(),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red))),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
            // Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       ' $selectedBloodGroup',
            //       style: TextStyle(fontSize: 20),
            //     ))
          ]),
        ));
  }
}
