import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  final String imageUrl;
  const VideoWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: Icon(Icons.wifi_off),
                );
              }
            },
            errorBuilder: (_, error, stackTrace) {
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 2,
              ));
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.6),
            radius: 25,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
