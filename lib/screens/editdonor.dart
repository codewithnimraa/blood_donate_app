import 'package:blood_donate_app/screens/splash.dart';
import 'package:flutter/material.dart';

class EditDonor extends StatefulWidget {
  const EditDonor({super.key});

  @override
  State<EditDonor> createState() => _EditDonorState();
}

class _EditDonorState extends State<EditDonor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "All Donors ",
          textAlign: TextAlign.right,
        ),
      ),
      body: Container(
          child: Column(children: [
        const ListTile(
          leading: Text(
            'Name : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            'Nimra Saleem',
            // style: TextStyle(fontSize: 10),
          ),
        ),
        const ListTile(
          leading: Text(
            'Area : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            ' Karachi',
            // style: TextStyle(fontSize: 10),
          ),
        ),
        const ListTile(
          leading: Text(
            'Last Donation Month : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            ' 21/08/23',
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
            child: const Text("A+"),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Text(
            'Name : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            'Laiba ',
            // style: TextStyle(fontSize: 10),
          ),
        ),
        const ListTile(
          leading: Text(
            'Area : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            ' North karachi',
            // style: TextStyle(fontSize: 10),
          ),
        ),
        const ListTile(
          leading: Text(
            'Last Donation Month : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            ' 02/10/23',
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
            child: const Text("O-"),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Text(
            'Name : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            'Sara ',
            // style: TextStyle(fontSize: 10),
          ),
        ),
        const ListTile(
          leading: Text(
            'Area : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            ' Shadman Town',
            // style: TextStyle(fontSize: 10),
          ),
        ),
        const ListTile(
          leading: Text(
            'Last Donation Month : ',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            ' 07/11/23',
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
            child: const Text("B+"),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: SizedBox(
            height: 70,
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red))),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                "LOG OUT",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        )

        // Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       ' $selectedBloodGroup',
        //       style: TextStyle(fontSize: 20),
        //     ))
        ,
      ])),
    );
  }
}
