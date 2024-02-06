
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/alert.dart';
import 'package:notes_app/config.dart';
import 'package:notes_app/login_api.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool deleteButton = false;


  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    ConfigModel configModel = Provider.of<ConfigModel>(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(15),
                  child:  Row(
                    children: [
                      const Text(
                        'Welcome back,\n{username}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            try {
                              final String message = await LoginApi().logout(configModel);
                              Navigator.pop(context);
                              Alert().showAlert(context, 'Logout', message);
                            } catch (e) {
                              print('Error: $e');
                            }
                          }
                          , icon: const Icon(Icons.logout, color: Colors.black,))
                    ],
                  ),
                ),
                Container(
                  width: maxWidth,
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        icon: const Icon(CupertinoIcons.trash_circle_fill, color: Colors.red,),
                        iconSize: 30,
                        onPressed: (){
                          setState(() {
                            deleteButton = !deleteButton;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    width: maxWidth,
                    height: maxHeight * 0.78,
                    child: GridView.builder(
                        physics: const ScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2), // Shadow color
                                  spreadRadius: 2, // Spread radius of the shadow
                                  blurRadius: 4,   // Blur radius of the shadow
                                  offset: const Offset(0, 2), // Offset of the shadow
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
                                      const Text('What is Lorem Ipsum? Lorem Ipsum',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,),
                                      const SizedBox(height: 10,),
                                      const Text("Lorem Ipsum is simply dummy text of the printing"
                                          " and typesetting industry. Lorem Ipsum has"
                                          " been the industry's standard dummy text"
                                          " ever since the 1500s, when an unknown printer"
                                          " took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"
                                          " but also the leap into electronic typesetting, remaining essentially unchanged."
                                          " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                                          " and more recently with "
                                          "desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 11
                                        ),),
                                      const Spacer(),
                                      Container(
                                        child: const Text('26 Jan 2024',
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
            const Positioned(
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