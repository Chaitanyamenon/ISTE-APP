import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ISTEApp(),
    );
  }
}

class ISTEApp extends StatefulWidget {
  @override
  _ISTEAppState createState() => _ISTEAppState();
}

class _ISTEAppState extends State<ISTEApp> {
  int currentIndex = 0;
  bool isDarkMode = false;

  final List<Widget> pages = [
    LandingPage(),
    ChatPage(),
    TeamPage(),
    MoreOptionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'ISTE : NITK',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.person,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            // Profile action
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
        shape: Border(
          bottom: BorderSide(
            color: isDarkMode ? Colors.white : Colors.black,
            width: 1.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.black87, Colors.deepPurpleAccent]
                : [Colors.white, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        selectedItemColor: isDarkMode ? Colors.white : Colors.black,
        unselectedItemColor: isDarkMode ? Colors.white70 : Colors.black54,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More Options',
          ),
        ],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        (Theme.of(context).brightness == Brightness.dark); // Local check

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'CHAITANYA MENON',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    'CRYPT',
                    style: TextStyle(
                      fontSize: 18,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  Text(
                    'Mazdoor',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              'UPCOMING EVENTS:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 16),
            EventBox(
              title: 'Dec 2: ISTE Meet the new recruits!',
              isDarkMode: isDarkMode,
            ),
            EventBox(
              title: 'Dec 5: ISTE CRYPT : Meet\'n Greet',
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: 32),
            Text(
              'NOTIFICATIONS:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 16),
            NotificationBox(
              sender: 'Ansh',
              message: 'Be there on time!',
              isDarkMode: isDarkMode,
            ),
            NotificationBox(
              sender: 'Harsh',
              message: 'RR on December 6 bois!',
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}

class EventBox extends StatelessWidget {
  final String title;
  final bool isDarkMode;

  const EventBox({required this.title, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class NotificationBox extends StatelessWidget {
  final String sender;
  final String message;
  final bool isDarkMode;

  const NotificationBox({
    required this.sender,
    required this.message,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            child: Text(
              sender[0],
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              '$sender: $message',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Text(
        'New chats here!',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Text(
        'See the ISTE members here!',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class MoreOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Text(
        'More options!',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

