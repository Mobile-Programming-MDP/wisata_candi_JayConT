import 'package:flutter/material.dart';
import 'package:wisata_candi/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Create Variable Declaration
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  // TODO: 5. SignIn Function
  void signIn () {
    // setState(() {
    //   isSignedIn = !isSignedIn;
    // });
    Navigator.pushNamed(context, '/signin');
  }
  // TODO: 6. SignOut Function
  void signOut () {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // TODO: 2. Profile Header with Profile Picture
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if(isSignedIn)
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple[50],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                // TODO: 3. Profile Info containing profile information
                const SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(height: 4,),
                ProfileInfoItem(
                  icon: Icons.lock,
                  label: 'Pengguna',
                  value: userName,
                  iconColor: Colors.amber,
                ),
                const SizedBox(height: 4,),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(height: 4,),
                ProfileInfoItem(
                  icon: Icons.person,
                  label: 'Nama',
                  value: fullName,
                  showEditIcon: isSignedIn,
                  onEditPressed: () {
                    debugPrint('Edit icon is pressed.');
                  },
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 4,),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(height: 4,),
                ProfileInfoItem(
                  icon: Icons.favorite,
                  label: 'Favorit',
                  value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                  iconColor: Colors.red,
                ),
                // TODO: 4. Profile Actions containing TextButtons for signing in and out
                const SizedBox(height: 4,),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(height: 20,),
                isSignedIn ? TextButton(
                  onPressed: signOut, child: const Text('Sign Out')
                  )
                  : TextButton(
                    onPressed: signIn, child: const Text('Sign In')
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}