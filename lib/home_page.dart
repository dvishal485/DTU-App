import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dtu/models/dtu_api.dart';
import 'package:flutter/material.dart';
import 'package:dtu/discover_page.dart';
import 'package:dtu/icons.dart';
import 'package:dtu/widgets/about_page.dart';
import 'package:dtu/widgets/svg_asset.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DiscoverPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const SvgAsset(assetName: AssetName.discover),
              label: '',
              tooltip: 'DTU Homepage',
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff4A80F0).withOpacity(0.3),
                        offset: const Offset(0, 4),
                        blurRadius: 20),
                  ],
                ),
                child: const SvgAsset(
                    assetName: AssetName.discover,
                    color: Color(0xff4A80F0)),
              ),
            ),
            BottomNavigationBarItem(
              icon: const SvgAsset(assetName: AssetName.profile),
              label: '',
              tooltip: 'About',
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff4A80F0).withOpacity(0.3),
                        offset: const Offset(0, 4),
                        blurRadius: 20),
                  ],
                ),
                child: const SvgAsset(
                  assetName: AssetName.profile,
                  color: Color(0xff4A80F0),
                ),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          backgroundColor: const Color(0xff1C2031),
        ),
      ),
    );
  }
}

Future<DtuAPI> fetchFromRemoteAPI() async {
  final response = await http.get(Uri.parse('https://dtu-api.vercel.app/api'));
  if (response.statusCode == 200) {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('counter', response.body);
    return DtuAPI.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to connect to the server');
  }
}

void snackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('No response from server!'),
    ),
  );
}

Future<DtuAPI> getFromStoredAPI() async {
  final prefs = await SharedPreferences.getInstance();
  final counter = prefs.getString('counter');
  if (counter == null) {
    return fetchFromRemoteAPI();
  } else {
    try {
      return DtuAPI.fromJson(jsonDecode(counter));
    } catch (e) {
      return fetchFromRemoteAPI();
    }
  }
}
