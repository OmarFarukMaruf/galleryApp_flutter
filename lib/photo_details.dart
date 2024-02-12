import 'package:assignment_03/photos.dart';
import 'package:flutter/material.dart';

class PhotoDetails extends StatelessWidget {
  final Photo photo;
  const PhotoDetails({Key? key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
        child: Center(
          child: Column(
            children: [
              Image.network(photo.url),
              const SizedBox(height: 16),
              Wrap(children: [ Text("Title: ${photo.title}", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)]),
              Text("ID: ${photo.id}", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),

            ],
          ),
        ),
      ),
    );
  }
}
