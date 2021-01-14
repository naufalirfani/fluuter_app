import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'login.dart';

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
      home: MyHomePage(title: 'BelajarFlutter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final myController = TextEditingController();
  String _selectedItem = 'Sun';
  List _options = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List gambar = [
    "https://firebasestorage.googleapis.com/v0/b/kedirilagi-17c91.appspot.com/o/imagesPage%2FAir%20Terjun%20Dolo.jpg?alt=media&token=afaa3e5b-810b-4295-9e19-c72fcdd4dd85",
    "https://firebasestorage.googleapis.com/v0/b/kedirilagi-17c91.appspot.com/o/imagesPage%2FAir%20terjun%20Irenggolo.jpg?alt=media&token=73111485-2e49-4fac-b081-26a7e6aa4f0b",
    "https://firebasestorage.googleapis.com/v0/b/kedirilagi-17c91.appspot.com/o/imagesPage%2FCandi%20Setono%20Gedong.jpg?alt=media&token=1c5296fb-71f7-4b57-9ffd-f28df95fbe0c",
    "https://firebasestorage.googleapis.com/v0/b/kedirilagi-17c91.appspot.com/o/imagesPage%2FCandi%20Surawana.JPG?alt=media&token=5614c53c-41b2-4620-ac7a-163848d0f773",
  ];
  final List namagambar = [
    "Air Terjun Dolo",
    "Air terjun Irenggolo",
    "Candi Setono Gedong",
    "Candi Surawana"
  ];

  void _incrementCounter() {
    setState(() {
      if(myController.text.isNotEmpty){
        int _jumlah = int.parse(myController.text);
        _counter = _jumlah;
      }
      else{
        Fluttertoast.showToast(
            msg: "Harap masukkan angka",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }

  void _newPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
                msg: "This is Center Short Toast",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Search"),
              ));
            },
            child: Icon(
              Icons.search,
              size: 26.0,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext bc) {
              return _options
                  .map((day) => PopupMenuItem(
                child: Text(day),
                value: day,
              ))
                  .toList();
            },
            onSelected: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.all(16.0),
            child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Card(
                          child: Container(
                            width: 150,
                            margin: EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: namagambar[index],
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl: gambar[index],
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Text("Koneksi Error"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                                    child: Text(
                                      namagambar[index],
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ),
                        );
                      },
                      itemCount: gambar.length,
                    ),
                  ),
                  Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(
                          msg: "Text dipilih",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    child: Text(
                      'Ini Text Pertama Saya saat belajar flutter. Sangat menyenangkan dapat belajar flutter dengan mudah dan menarik',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Stack(
                    children: [
                      Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 40,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.blue,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: myController,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Insert Your Number",
                        fillColor: Colors.white
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                  CachedNetworkImage(
                    imageUrl: "https://cdn.pixabay.com/photo/2019/11/10/17/36/indonesia-4616370_1280.jpg",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Text("Koneksi Error"),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                    child: MaterialButton(
                      height: 50.0,
                      minWidth: double.infinity,
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: new Text(
                        "New Page",
                        style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => {_newPage()},
                      splashColor: Colors.redAccent,
                    ),
                  )
                ],
              ),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
