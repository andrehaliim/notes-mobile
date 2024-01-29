import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool deleteButton = false;


@override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width;
    double mainHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 0,
              child: IconButton(
                icon: Icon(CupertinoIcons.trash_circle_fill, color: Colors.red,),
                iconSize: 40,
                onPressed: (){
                  setState(() {
                    deleteButton = !deleteButton;
                  });
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Welcome back,\n{username}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: mainWidth,
                    height: mainHeight * 0.83,
                    child: GridView.builder(
                        physics: const ScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3.0,
                          mainAxisSpacing: 3.0,
                        ),
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2), // Shadow color
                                  spreadRadius: 2, // Spread radius of the shadow
                                  blurRadius: 4,   // Blur radius of the shadow
                                  offset: Offset(0, 2), // Offset of the shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Text('What is Lorem Ipsum?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,),
                                      Text("Lorem Ipsum is simply dummy text of the printing"
                                          " and typesetting industry. Lorem Ipsum has"
                                          " been the industry's standard dummy text"
                                          " ever since the 1500s, when an unknown printer"
                                          " took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"
                                          " but also the leap into electronic typesetting, remaining essentially unchanged."
                                          " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                                          " and more recently with "
                                          "desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 11
                                      ),),
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Text('26 Jan 2024',
                                            style: TextStyle(
                                                fontSize: 11
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(deleteButton == false ? CupertinoIcons.pencil_circle_fill : CupertinoIcons.trash_circle_fill),
                                    iconSize: 30,
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: IconButton(
                icon: Icon(CupertinoIcons.plus_circle_fill, color: Colors.amber,),
                iconSize: 50,
                onPressed: null,
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
