import 'package:flutter/material.dart';

class ImageProvider extends StatelessWidget {

  final String imageUrl;

  const ImageProvider({super.key, required this.imageUrl});

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(imageUrl),
      ),
    );
  }
}
