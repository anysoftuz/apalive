import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ProfileCardBlur(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfileCardBlur extends StatelessWidget {
  const ProfileCardBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Profile image
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Adham_Bekmurodov.jpg/640px-Adham_Bekmurodov.jpg',
                width: 300,
                height: 400,
                fit: BoxFit.cover,
              ),

              // Blur overlay with text
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      // Blur background
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          color: Colors.black.withValues(alpha:0.4),
                        ),
                      ),
                      // Text content
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "BEKMURODOV ADXAM\nSHARIPOVICH",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "O‘zbekiston Respublikasi Prezidenti huzuridagi\nDavlat boshqaruvi akademiyasi rektori",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: const [
                                Icon(Icons.facebook, color: Colors.white),
                                SizedBox(width: 12),
                                Icon(Icons.linked_camera, color: Colors.white),
                                SizedBox(width: 12),
                                Icon(Icons.camera_alt, color: Colors.white),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
