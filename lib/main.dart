import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageTabBar(), debugShowCheckedModeBanner: false,
    );
  }
}

// Container Widget
class PageWidgetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Colors.black,
        child: Text("My Container"),
        width: 300,
        height: 500,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        foregroundDecoration: new BoxDecoration(
          color: Colors.lightGreen
        ),
      ),
    );
  }
}

// row and column
class PageRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text("Ini adalah Row"),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("this"),
              new Text("is"),
              new Text("column")
            ],
          ),
        new Text("ini row juga")
        ],
      ),
    );
  }
}

// Basic List
class BasicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: [
          new ListTile(
            title: Text("Makanan"),
            trailing: Icon(Icons.fastfood),
          ),
          new ListTile(
            title: Text("Minuman"),
            trailing: Icon(Icons.local_drink),
          ),
          new ListTile(
            title: Text("Phone"),
            trailing: Icon(Icons.contact_phone),
          ),
          new ListTile(
            title: Text("Alarms"),
            trailing: Icon(Icons.alarm),
          ),
          new ListTile(
            title: Text("Cameras"),
            trailing: Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}

// List Widget (ArrayList)
class ListWidgetArrayList extends StatefulWidget {
  @override
  _ListWidgetArrayListState createState() => _ListWidgetArrayListState();
}

class _ListWidgetArrayListState extends State<ListWidgetArrayList> {

  List<int> dataList = new List();

  @override
  void initState() {
    super.initState();
    for(int i =0 ; i<25 ; i++){
      dataList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int number){
          return new ListTile(
            title: new Text("item number - $number"),
            trailing: Icon(Icons.print),
          );
        },
      ),
    );
  }
}

// simple grid view
// appbar
// appbar leading action
class PageGridView extends StatefulWidget {
  @override
  _PageGridViewState createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {

  List<int> itemGrid = new List();

  @override
  void initState() {
    super.initState();
    for(int i = 0; i<16; i++) {
      itemGrid.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Grid View"),
        backgroundColor: Colors.green,
        // titleSpacing: 80.0,
        elevation: 35.0,
        toolbarOpacity: 0.6,
        actions: [
          new IconButton(icon: Icon(Icons.menu), onPressed: (){}),
          new IconButton(icon: Icon(Icons.details), onPressed: (){})
        ],
      ),
      body: new GridView.builder(
          itemCount: itemGrid.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int item){
            return Card(
              color: Colors.lightGreen,
              child: new Padding(padding: const EdgeInsets.all(25)),
            );
          }),
    );
  }
}

class PageTabBar extends StatefulWidget {
  @override
  _PageTabBarState createState() => _PageTabBarState();
}

class _PageTabBarState extends State<PageTabBar> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bar"),
        backgroundColor: Colors.lightGreen,
        bottom: new TabBar(
            controller: tabController,
            tabs: [
              new Tab(icon: new Icon(Icons.home),),
              new Tab(icon: new Icon(Icons.dashboard),),
              new Tab(icon: new Icon(Icons.settings),),
              new Tab(icon: new Icon(Icons.close),),
            ]
        ),
      ),
      body: new TabBarView(
        controller: tabController,
        children: [
          new Center(child: Text("welcome to home page"),),
          new Center(child: Text("welcome to dashboard page"),),
          new Center(child: Text("welcome to settings page"),),
          new Center(child: Text("welcome to close page"),),
        ],
      ),
    );
  }
}






