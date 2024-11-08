import 'package:flutter/material.dart';
import 'package:kuis_2/shared/custom_button.dart';
import 'dart:math';

import 'package:kuis_2/shared/custom_decoraton.dart';

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  State<PiramidPage> createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double? luas;
  double? volume;

  void _hitungPiramid() {
    if (_formKey.currentState!.validate()) {
      double tinggi = double.parse(_tinggiController.text);
      double panjang = double.parse(_panjangController.text);
      double lebar = double.parse(_lebarController.text);

      double luasAlas = panjang * lebar;
      double tinggiSegitiga =
          sqrt((tinggi * tinggi) + (panjang / 2 * panjang / 2));
      double luasSegitiga1 = (panjang * tinggiSegitiga) / 2;
      double luasSegitiga2 = (lebar * tinggiSegitiga) / 2;

      setState(() {
        luas = luasAlas + (2 * luasSegitiga1) + (2 * luasSegitiga2);
        volume = (luasAlas * tinggi) / 3;
      });
    }
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field ini tidak boleh kosong';
    }
    if (double.tryParse(value) == null) {
      return 'Masukkan angka yang valid';
    }
    if (double.parse(value) <= 0) {
      return 'Nilai harus lebih besar dari 0';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Piramida"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _tinggiController,
                        keyboardType: TextInputType.number,
                        validator: _validateInput,
                        decoration: customDecoration().copyWith(
                            label: Text("Tinggi"),
                            hintText: "Masukkan tinggi piramida"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _panjangController,
                        keyboardType: TextInputType.number,
                        validator: _validateInput,
                        decoration: customDecoration().copyWith(
                            label: Text("Panjang"),
                            hintText: "Masukkan panjang alas piramida"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _lebarController,
                        keyboardType: TextInputType.number,
                        validator: _validateInput,
                        decoration: customDecoration().copyWith(
                            label: Text("Lebar"),
                            hintText: "Masukkan lebar alas piramida"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      customButton(
                          context: context,
                          onPressed: _hitungPiramid,
                          child: Text("Hitung")),
                      SizedBox(height: 20),
                      if (luas != null && volume != null)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "Hasil Perhitungan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Luas Permukaan: ${luas!.toStringAsFixed(2)} satuan luas",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Volume: ${volume!.toStringAsFixed(2)} satuan volume",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tinggiController.dispose();
    _panjangController.dispose();
    _lebarController.dispose();
    super.dispose();
  }
}
