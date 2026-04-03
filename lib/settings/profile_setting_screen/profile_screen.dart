import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String name = "";
  String email = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    try {
      if (user == null) {

        setState(() => isLoading = false);
        return;
      }



      final snapshot =
      await dbRef.child("users/${user!.uid}").get();



      if (snapshot.exists) {
        final data = snapshot.value as Map;

        setState(() {
          name = data["name"] ?? "";
          email = data["email"] ?? "";
          phoneController.text = data["phone"] ?? "";
          addressController.text = data["address"] ?? "";
          isLoading = false;
        });
      } else {


        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("ERROR: $e");

      setState(() {
        isLoading = false;
      });
    }
  }

  void saveData() async {
    if (user == null) return;

    await dbRef.child("users/${user!.uid}").update({
      "phone": phoneController.text,
      "address": addressController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile Updated")),
    );
  }

  void deleteData() async {
    if (user == null) return;

    await dbRef.child("users/${user!.uid}").remove();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile Data Deleted")),
    );

    phoneController.clear();
    addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // USER INFO (READ ONLY)
            Text("Name: $name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            SizedBox(height: 5),

            Text("Email: $email"),

            SizedBox(height: 20),

            // PHONE FIELD
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // ADDRESS FIELD
            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // SAVE BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: saveData,
              child: Text("Save",
              style: TextStyle(fontSize: 20),),
            ),

            SizedBox(height: 10),

            // DELETE BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: deleteData,
              child: Text("Delete Data",
                style: TextStyle(color: Colors.black,
                fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}