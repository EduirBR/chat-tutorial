import 'package:flutter/material.dart';
import 'package:chatcito/apps/main/pages/settings_page.dart';
import 'package:chatcito/apps/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthServices();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    var edgeInsets = const EdgeInsets.only(left: 25, bottom: 20);
    return Drawer(
      child: Container(
        padding: edgeInsets,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                DrawerHeader(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 100),
                      child: Image.asset('assets/logo_nobg.png')),
                ),
                //menu items

                // ListTile(
                //   leading: const Icon(Icons.home),
                //   title: const Text("Home"),
                //   onTap: () {},
                // ),

                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingPage()));
                  },
                ),
              ],
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: logout),
          ],
        ),
      ),
    );
  }
}
