import 'package:flutter/material.dart';
import 'dart:math';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'package:flutter/services.dart'; //rootbundle
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'where is it used ?',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> _products = List.generate(
      100,
      (index) => {
            "id": index,
            "name": "Product $index",
            "price": Random().nextInt(100)
          }).toList();
  final List<Map> _bookList = [
    { "id" : "1",
      "name" : "어린왕자",
      "subtitle" : "the little prince",
    },
    { "id" : "2",
      "name" : "1984",
      "subtitle" : "1984",
    },
  ];

  // late List<List<dynamic>> employeeData;

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // List<PlatformFile>? _paths;
  // String? _extension="csv";
  // FileType _pickingType = FileType.custom;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   employeeData  = List<List<dynamic>>.empty(growable: true);
  // }

  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English And Korean Classic Novel'),
        
      ),
      body: 
          Column(
            children: [
              const SizedBox(
                height: 3,
              ),
              PlutoMenuBar(
                menus: [
                  PlutoMenuItem(
                    icon: Icons.star,
                    title: "Favorite",
                    onTap: () => message(context, 'star'),
                  ),
                  PlutoMenuItem(
                    icon: Icons.bedroom_baby,
                    title: 'Level 0',
                    onTap: () => message(context, 'baby'),
                  ),
                  PlutoMenuItem(
                    icon : Icons.school,
                    title: 'Level1',
                    onTap: () => message(context, 'school'),
                  ),
                  PlutoMenuItem(
                    icon : Icons.stacked_bar_chart,
                    title: 'Level2',
                    onTap: () => message(context, 'design'),
                  ),
                ],
              ),
              const SizedBox(
              height: 3,
              ),
              Flexible(
              child: Container(
                // padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    padding: const EdgeInsets.all(30),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100,
                        childAspectRatio: 3 / 3,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 40),
                    itemCount: _bookList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: (){
                            message(context, 'booktouch');
                          },
                        child: GridTile(
                          key: ValueKey(_bookList[index]['id']),
                        
                            child: Image.network(
                              'https://blogfiles.pstatic.net/MjAyMjA3MDlfMTg3/MDAxNjU3MzQzNDU5MTMy.l5aLSBEiDIyUqst-en2YNW7OOSwCLAua2eyxb2a0Onwg.iUjzBZdNSqTDyYxmejZkSmIZ3kKX5Deb7GPJof0CKUcg.PNG.aspirinii/bookBrown.png',
                              fit: BoxFit.cover,
                            ),
                          header: GridTileBar(
                            backgroundColor: Colors.black54.withAlpha(0),
                            title: Text(
                              _bookList[index]['name'],
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              _bookList[index]['subtitle'],
                              style : const TextStyle( fontSize: 10)
                      
                            ),
                            // trailing: const Icon(
                            //   Icons.star,
                            //   size : 13
                            //   ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            ]
          ),

    );
  }
  
  // openFile(filepath) async
  // {
  //   File f = new File(filepath);
  //   print("CSV to List");
  //   final input = f.openRead();
  //   final fields = await input.transform(utf8.decoder).transform(new CsvToListConverter()).toList();
  //   print(fields);
  //   setState(() {
  //     employeeData=fields;
  //   });
  // }

  // void _openFileExplorer() async {

  //   try {

  //     _paths = (await FilePicker.platform.pickFiles(
  //       type: _pickingType,
  //       allowMultiple: false,
  //       allowedExtensions: (_extension?.isNotEmpty ?? false)
  //           ? _extension?.replaceAll(' ', '').split(',')
  //           : null,
  //     ))
  //         ?.files;
  //   } on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   } catch (ex) {
  //     print(ex);
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     openFile(_paths![0].path);
  //     print(_paths);
  //     print("File path ${_paths![0]}");
  //     print(_paths!.first.extension);

  //   });
  // }


}
