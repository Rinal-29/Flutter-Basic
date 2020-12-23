import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      home: PageImageAssets(), debugShowCheckedModeBanner: false,
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

// input and selection widget
class PageInputSelectWidget extends StatefulWidget {
  @override
  _PageInputSelectWidgetState createState() => _PageInputSelectWidgetState();
}

class _PageInputSelectWidgetState extends State<PageInputSelectWidget> {

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Input Widget"),
        backgroundColor: Colors.redAccent,
      ),

      body: new Column(
        children: [
          new TextField(
            onChanged: (String txt) {
              setState(() {
                text = txt;
              });
            },
            decoration: new InputDecoration(
                hintText: "Input Username",
                labelText: "Username"
            ),
          ),
          SizedBox(height: 20),
          Text(text)
        ],
      ),
    );
  }
}

// button widget
class PageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Widget Button"),
      ),
      body: new Column(
        children: [
          new RaisedButton(onPressed: (){}, child: Text("Raised Button"),),
          new FlatButton(onPressed: (){}, child: Text("Flat Button")),
          new MaterialButton(
            onPressed: (){},
            child: Text("Material Button"),
            color: Colors.greenAccent,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}

// slider widget
class PageSliderWidget extends StatefulWidget {
  @override
  _PageSliderWidgetState createState() => _PageSliderWidgetState();
}

class _PageSliderWidgetState extends State<PageSliderWidget> {

  double drag = 1.0;

  void methodDragValue(value){
    setState(() {
      drag = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Slider Widget"),
        backgroundColor: Colors.redAccent,
      ),

      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Slider(
                value: drag,
                min: 1.0,
                max: 10.0,
                onChanged: (double val){
                  methodDragValue(val);
                }
            ),
            new Text("value + $drag")
          ],
        ),
      ),
    );
  }
}

// page simple dialog
// snackbar
// toast
class PageAlertDialog extends StatefulWidget {
  @override
  _PageAlertDialogState createState() => _PageAlertDialogState();
}

class _PageAlertDialogState extends State<PageAlertDialog> {

  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  SimpleDialog simpleDialog;

  void showSnackbar() {
    _key.currentState.showSnackBar(
      new SnackBar(content: Text("Snackbar Showed"))
    );
  }

  void showSimpleDialog() {
    simpleDialog = new SimpleDialog(
      title: new Text("Warning!"),
      children: [
        new SimpleDialogOption(
          child: new Text("Jakarta"),
          onPressed: (){
            print("jakarta");
          },
        ),

        new SimpleDialogOption(
          child: new Text("Makassar"),
          onPressed: () {
            print("Makassar");
          },
        ),

        new SimpleDialogOption(
          child: new Text("Exit"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: simpleDialog);
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      child: new AlertDialog(
        title: Text("Warning"),
        content: Text("Apakah Anda Yakin ingin Keluar ?"),
        actions: [
          new IconButton(icon: Icon(Icons.close), color: Colors.lightGreen, onPressed: () {
            Navigator.pop(context);
          }),

          new IconButton(icon: Icon(Icons.check), color: Colors.redAccent, onPressed: () {
            Navigator.pop(exit(0));
          })
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Alert Dialog"),
        backgroundColor: Colors.greenAccent,
      ),

      key: _key,

      body: new Center(
        child: new Column(
          children: [
            new RaisedButton(
              onPressed: () {
                showSimpleDialog();
                }, child: Text("Show Alert Dialog"),
            ),

            new MaterialButton(
                onPressed: () {
                  showSnackbar();
                },
              child: Text("Show Snackbar"),
              color: Colors.greenAccent,
              textColor: Colors.white,
            ),

            new MaterialButton(
                onPressed: () {
                  showAlertDialog();
            },
              child: Text("Show Alert"),
              color: Colors.redAccent,
              textColor: Colors.white,
            ),

            new MaterialButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "Ini Adalah Toast",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.white,
                    backgroundColor: Colors.grey
                  );
                },
              child: Text("Show Toast"),
              color: Colors.purpleAccent,
              textColor: Colors.white,
            )
          ],
        )
      ),
    );
  }
}

// hero animation
class PageMainAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
        backgroundColor: Colors.redAccent,
      ),

      body: GestureDetector(
        child: Hero(
            tag: "Image Hero",
            child: Image.network("https://upload.wikimedia.org/wikipedia/id/b/b0/Avatar-Teaser-Poster.jpg")),

        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailHeroAnimation();
          }));
        },
      ),
    );
  }
}

class DetailHeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
            tag: "Image Hero",
            child: Image.network("https://upload.wikimedia.org/wikipedia/id/b/b0/Avatar-Teaser-Poster.jpg")),

        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

// image assets
class PageImageAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image from assets"),
        backgroundColor: Colors.redAccent,
      ),

      body: Column(
        children: [
          Image.asset("images/SEMNASKKN.jpeg", height: 200,),
          Text("Kkn Images"),
          SizedBox(height: 35.0,),

          Text("Image Form URL",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network("https://akcdn.detik.net.id/visual/2017/03/12/d0dc4c69-494e-4526-aab5-8010a79c744f_169.jpg?w=650", 
              height: 150,
              width: 150,),
              
              Image.network("https://static.hollywoodreporter.com/sites/default/files/2019/03/avatar-publicity_still-h_2019-compressed.jpg",
              height: 150,
              width: 150,)
            ],
          )
        ],
      ),
    );
  }
}














