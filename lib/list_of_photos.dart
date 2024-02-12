import 'dart:convert';
import 'package:assignment_03/photo_details.dart';
import 'package:assignment_03/photos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListOfPhotos extends StatefulWidget {

  @override
  _ListOfPhotosState createState() => _ListOfPhotosState();
}

class _ListOfPhotosState extends State<ListOfPhotos> {

  Future<List<Photo>>? _photos;

  @override
  void initState() {
    super.initState();
    _photos = fetchPhotos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery App"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: _photos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final photo = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      leading: Image.network(photo.thumbnailUrl),
                      title: Text(photo.title),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoDetails(photo: photo)));
                      },
                    ),
                  );
                });
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());

        },
      )
    );
  }
}

Future<List<Photo>> fetchPhotos() async {
  const String url = 'https://jsonplaceholder.typicode.com/photos';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> json = jsonDecode(response.body);
    return json.map((map) => Photo.fromJson(map)).toList();
  } else {
    throw Exception('Failed to load photos');
  }
}

