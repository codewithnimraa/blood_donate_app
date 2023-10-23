import 'package:flutter/material.dart';

class BloodGroupSelectionPage extends StatefulWidget {
  const BloodGroupSelectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BloodGroupSelectionPageState createState() =>
      _BloodGroupSelectionPageState();
}

class _BloodGroupSelectionPageState extends State<BloodGroupSelectionPage> {
  String selectedBloodGroup = 'A+';

  List<String> bloodGroups = ['A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-'];

  void navigateToNextPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NextPage(selectedBloodGroup),
      ),
    );
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
body:      
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Blood Group Selection'),
            DropdownButton<String>(
              value: selectedBloodGroup,
              items: bloodGroups.map((String bloodGroup) {
                return DropdownMenuItem<String>(
                  value: bloodGroup,
                  child: Text(bloodGroup),
                );
              }).toList(), // Move .toList() here
              onChanged: (newValue) {
                setState(() {
                  selectedBloodGroup = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: navigateToNextPage,
                child: Text('OK'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red))),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final String selectedBloodGroup;
  NextPage(
    this.selectedBloodGroup,
  );

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
      body: Column(children: [
        ListTile(
          title: Text(
            'Name : ',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ListTile(
          leading: Text(
            'Selected Blood Group :',
            style: TextStyle(color: Colors.red),
          ),
          title: Text(
            ' $selectedBloodGroup',
            style: TextStyle(fontSize: 20),
          ),
        ),
        // Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       ' $selectedBloodGroup',
        //       style: TextStyle(fontSize: 20),
        //     ))
      ]),
    );
  }
}