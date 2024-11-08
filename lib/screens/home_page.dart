import 'package:flutter/material.dart';
import 'package:kuis_2/screens/cek_hari_page.dart';
import 'package:kuis_2/screens/konversi_waktu_page.dart';
import 'package:kuis_2/screens/piramid_page.dart';
import 'package:kuis_2/screens/profile_page.dart';
import 'package:kuis_2/shared/custom_button.dart';
import 'package:kuis_2/shared/navigate_to.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_currentMenu == 0 ? "Menu Utama" : "Profile"),
        ),
        body: _currentMenu == 0
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    customButton(
                        context: context,
                        onPressed: () {
                          navigateTo(context: context, target: PiramidPage());
                        },
                        child: const Text("Piramida")),
                    SizedBox(
                      height: 12,
                    ),
                    customButton(
                        context: context,
                        onPressed: () {
                          navigateTo(
                              context: context, target: KonversiWaktuPage());
                        },
                        child: const Text("Konversi Waktu")),
                    SizedBox(
                      height: 12,
                    ),
                    customButton(
                        context: context,
                        onPressed: () {
                          navigateTo(context: context, target: CekHariPage());
                        },
                        child: const Text("Cek Hari")),
                  ],
                ),
              )
            : const ProfilePage(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentMenu, // Tambahkan currentIndex
            onTap: (value) {
              setState(() {
                _currentMenu = value;
                debugPrint(_currentMenu.toString());
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]));
  }
}
