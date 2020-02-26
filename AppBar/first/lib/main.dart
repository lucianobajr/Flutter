import "bottom_navy_bar.dart";
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  int _counter = 0;
   void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nav Bar"),backgroundColor: Color.fromARGB(255, 211, 245, 206)),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home',style:TextStyle(
                
              ) ,),
              icon: Icon(Icons.home),
              activeColor: Color.fromARGB(255,32,83,116),
          ),
          BottomNavyBarItem(
              title: Text('Favorite'),
              icon: Icon(Icons.favorite_border),
              activeColor: Color.fromARGB(255,39,160,158),

          ),
          BottomNavyBarItem(
              title: Text('Search'),
              icon: Icon(Icons.search),
              activeColor: Color.fromARGB(255,48,206,136),

          ),
          BottomNavyBarItem(
              title: Text('Profile'),
              icon: Icon(Icons.person_outline),
              activeColor: Color.fromARGB(255,125,227,147),
          ),
        ],
      ),
    );
  }
}