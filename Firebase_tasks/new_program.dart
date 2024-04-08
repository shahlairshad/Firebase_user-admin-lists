import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myflutterproject/Firebase_tasks/loginscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

enum UserType { Admin, User }
class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  UserType _selectedUserType = UserType.User;

  void _signup(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('User signed up: ${userCredential.user!.uid}');

      // Store user data in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'email': _emailController.text,
        'userType': _selectedUserType == UserType.Admin ? 'admin' : 'user',
      });

      // Clear text fields
      _emailController.clear();
      _passwordController.clear();

      // After successful signup, navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      print('Error signing up user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField(
              value: _selectedUserType,
              onChanged: (value) {
                setState(() {
                  _selectedUserType = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: UserType.Admin,
                  child: Text('Admin'),
                ),
                DropdownMenuItem(
                  value: UserType.User,
                  child: Text('User'),
                ),
              ],
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _signup(context),
              child: Text('Sign Up'),
            ),
            SizedBox(height: 10.0),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => LoginScreen()),
            //     );
            //   },
            //   child: Text('Login'),
            // ),
          ],
        ),
      ),
    );
  }
}
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             DropdownButtonFormField(
//               value: _selectedUserType,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedUserType = value!;
//                 });
//               },
//               items: [
//                 DropdownMenuItem(
//                   value: UserType.Admin,
//                   child: Text('Admin'),
//                 ),
//                 DropdownMenuItem(
//                   value: UserType.User,
//                   child: Text('User'),
//                 ),
//               ],
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () => _signup(context),
//               child: Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void _signup(BuildContext context) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
//     print('User signed up: ${userCredential.user!.uid}');
//
//     // Store user data in Firestore
//     await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
//       'email': _emailController.text,
//       'userType': _selectedUserType == UserType.Admin ? 'admin' : 'user',
//     });
//
//     // After successful signup, navigate to login screen
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginScreen()),
//     );
//   } catch (e) {
//     print('Error signing up user: $e');
//   }
// }
