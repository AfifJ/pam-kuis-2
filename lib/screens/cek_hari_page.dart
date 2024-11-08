import 'package:flutter/material.dart';
import 'package:kuis_2/shared/custom_button.dart';

class CekHariPage extends StatefulWidget {
  const CekHariPage({super.key});

  @override
  State<CekHariPage> createState() => _CekHariPageState();
}

class _CekHariPageState extends State<CekHariPage> {
  final TextEditingController _inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? hasil;

  void _cekHari() {
    if (_formKey.currentState!.validate()) {
      int angka = int.parse(_inputController.text);
      String hari;

      switch (angka) {
        case 1:
          hari = 'Senin';
          break;
        case 2:
          hari = 'Selasa';
          break;
        case 3:
          hari = 'Rabu';
          break;
        case 4:
          hari = 'Kamis';
          break;
        case 5:
          hari = 'Jumat';
          break;
        case 6:
          hari = 'Sabtu';
          break;
        case 7:
          hari = 'Minggu';
          break;
        default:
          hari = 'Error: Silahkan masukkan angka 1-7';
      }

      setState(() {
        hasil = hari;
      });
    }
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Silahkan masukkan angka';
    }
    if (int.tryParse(value) == null) {
      return 'Input harus berupa angka';
    }
    int angka = int.parse(value);
    if (angka < 1 || angka > 7) {
      return 'Silahkan masukkan angka 1-7';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cek Hari"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              TextFormField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                validator: _validateInput,
                decoration: InputDecoration(
                  labelText: 'Masukkan Angka (1-7)',
                  hintText: 'Contoh: 1',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 16),
              customButton(
                  context: context,
                  onPressed: _cekHari,
                  child: Text("Cek Hari")),
              SizedBox(height: 24),
              if (hasil != null)
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hasil:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          hasil!,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
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
