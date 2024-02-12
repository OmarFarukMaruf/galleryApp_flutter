import 'package:assignment_03/list_of_photos.dart';
import 'package:flutter/material.dart';
class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.blue, foregroundColor: Colors.white,
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      home: ListOfPhotos(),

    );
  }
}
