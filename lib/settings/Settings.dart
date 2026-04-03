import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_food_ordering/settings/profile_setting_screen/profile_screen.dart';
import 'package:provider/provider.dart';

import '../provider/DarkmodeThemeprovider.dart';
import '../screens/User_login_screen.dart';

class AppSettings extends StatefulWidget {
  @override
  State<AppSettings> createState() => _SettingsState();
}

class _SettingsState extends State<AppSettings> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // PROFILE BUTTON
            ListTile(
              leading: Icon(Icons.person, color: Colors.orange),
              title: Text("Profile"),
              subtitle: Text("View and edit your profile"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to profile page
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
            ),

            Divider(),

            // DARK MODE TOGGLE
            Consumer<Darkmodethemeprovider>(builder:(ctx,provider,_){
              return SwitchListTile(
                secondary: Icon(Icons.dark_mode, color: Colors.orange),
                title: Text("Dark Mode"),
                value: provider.getThemeValue(),
                onChanged: (value) {
                  setState(() {
                    provider.updateTheme(value: value);
                  });
                },
              );
            }),


            Divider(),

            // LOGOUT BUTTON
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context); // close dialog

                          try {
                            await FirebaseAuth.instance.signOut();

                            // Navigate to login and remove all previous screens
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => UserLoginScreen()),
                                  (route) => false,
                            );

                          } catch (e) {
                            print("Logout error: $e");
                          }
                        },
                        child: Text("Logout"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}