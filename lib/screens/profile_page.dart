import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/110212622?v=4'), // Gambar dari network
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Nama: Afif Jamhari',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'NIM: 124220018',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tempat Lahir: Sleman',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tanggal Lahir: 20 Februari 2004',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Hobi: Membaca dan Menggambar',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
