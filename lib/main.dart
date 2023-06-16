import 'package:flutter/material.dart';

void main() {
  runApp(FacebookApp());
}

class FacebookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstagramHomePage(),
    );
  }
}

class InstagramHomePage extends StatefulWidget {
  @override
  _InstagramHomePageState createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Welcome To Home',
      style: optionStyle,
    ),
    Text(
      'This is Chat Room',
      style: optionStyle,
    ),
    Text(
      'Login Screen',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3b5998),
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          'Facebook',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Billabong',
            fontSize: 32.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notification_important_rounded,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              // Implement your logic here for the live TV button
            },
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              // Implement your logic here for the send button
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3b5998),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Implement your logic here for the profile option
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text('Chat Box'),
              onTap: () {
                // Implement your logic here for the settings option
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Implement your logic here for the logout option
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat Box',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Log Out',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 9, 30, 123),
        onTap: _onItemTapped,
      ),
    );
  }
}
