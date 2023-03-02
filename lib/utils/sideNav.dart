import 'package:cybershop/screens/profile_page/googlemap.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final String? image;
  const Navbar({Key? key, this.image}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              color: const Color.fromARGB(255, 24, 209, 138),
              padding: EdgeInsets.only(
                  top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
              child: Column(
                children: const [
                  SizedBox(height: 12),
                  Text(
                    'TrimMe',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Kathmandu, Nepal',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.my_library_books),
              title: const Text(
                'Location',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text(
                'About us',
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
