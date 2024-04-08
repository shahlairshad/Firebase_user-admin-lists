import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Admins'),
              Tab(text: 'Users'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Admin Tab
            AdminsTab(),
            // User Tab
            UsersTab(),
          ],
        ),
      ),
    );
  }
}
class AdminsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        List<QueryDocumentSnapshot> users = snapshot.data!.docs;
        List<QueryDocumentSnapshot> admins = users.where((user) => user['userType'] == 'admin').toList();

        return ListView.builder(
          itemCount: admins.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(admins[index]['email']),
            );
          },
        );
        },
    );
  }

}
class UsersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        List<QueryDocumentSnapshot> users = snapshot.data!.docs;
        List<QueryDocumentSnapshot> regularUsers = users.where((user) => user['userType'] == 'user').toList();

        return ListView.builder(
          itemCount: regularUsers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(regularUsers[index]['email']),

            );
            },
        );
        },
    );
  }
}




















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Number of tabs
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Home'),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Admins'),
//               Tab(text: 'Users'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Admin Tab
//             AdminsTab(),
//             // User Tab
//             UsersTab(),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class AdminsTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('users').where('userType', isEqualTo: 'admin').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//
//         List<QueryDocumentSnapshot> admins = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: admins.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(admins[index]['email']),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
// class UsersTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('users').where('userType', isEqualTo: 'user').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//
//         List<QueryDocumentSnapshot> users = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(users[index]['email']),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
//
//
// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 2, // Number of tabs
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Home'),
// //           bottom: TabBar(
// //             tabs: [
// //               Tab(text: 'Admins'),
// //               Tab(text: 'Users'),
// //             ],
// //           ),
// //         ),
// //         body: TabBarView(
// //           children: [
// //             // Admin Tab
// //             AdminTab(),
// //             // User Tab
// //             UserTab(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class AdminTab extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Replace this with your logic to fetch and display admin email IDs
// //     List<String> adminEmails = ['admin1@example.com', 'admin2@example.com'];
// //
// //     return ListView.builder(
// //       itemCount: adminEmails.length,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //           title: Text(adminEmails[index]),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class UserTab extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Replace this with your logic to fetch and display user email IDs
// //     List<String> userEmails = ['user1@example.com', 'user2@example.com'];
// //
// //     return ListView.builder(
// //       itemCount: userEmails.length,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //           title: Text(userEmails[index]),
// //         );
// //       },
// //     );
// //   }
// // }
