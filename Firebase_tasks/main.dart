import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myflutterproject/Firebase_tasks/loginscreen.dart';
import 'package:myflutterproject/Firebase_tasks/new_program.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBCJqukx-9i_ypnHIKt-qu4T6-E5D5P6qk",
          appId: "1:245985827333:android:fe67e0e5361eb8ce669a6c",
          messagingSenderId:"",
          projectId: "new-project-2-3b249",
          storageBucket: "new-project-2-3b249.appspot.com"
      )
  );
  runApp(MaterialApp(
    home: SignupLoginScreen(),
  ));
}

class SignupLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup/Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
            child: Text('Sign Up'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}

