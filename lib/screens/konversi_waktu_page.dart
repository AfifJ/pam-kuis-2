import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonversiWaktuPage extends StatefulWidget {
  const KonversiWaktuPage({super.key});

  @override
  State<KonversiWaktuPage> createState() => _KonversiWaktuPageState();
}

class _KonversiWaktuPageState extends State<KonversiWaktuPage> {
  DateTime selectedTime = DateTime.now();

  final Map<String, String> timezones = {
    'WIB (Jakarta)': 'Asia/Jakarta',
    'WITA (Makassar)': 'Asia/Makassar',
    'WIT (Jayapura)': 'Asia/Jayapura',
  };

  String selectedTimezone = 'Asia/Jakarta';

  String getFormattedTime(String timezone) {
    try {
      var now = DateTime.now();
      var timeZoneOffset = now.timeZoneOffset;

      final formatter = DateFormat('dd-MM-yyyy HH:mm:ss a');

      switch (timezone) {
        case 'Asia/Jakarta': // UTC+7
          return formatter
              .format(selectedTime.add(Duration(hours: 7) - timeZoneOffset));
        case 'Asia/Makassar': // UTC+8
          return formatter
              .format(selectedTime.add(Duration(hours: 8) - timeZoneOffset));
        case 'Asia/Jayapura': // UTC+9
          return formatter
              .format(selectedTime.add(Duration(hours: 9) - timeZoneOffset));
        default:
          return formatter.format(selectedTime);
      }
    } catch (e) {
      return 'Error converting time';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Waktu'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Waktu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              child: ListTile(
                title: Text(
                  DateFormat('dd-MM-yyyy').format(selectedTime) +
                      '\n' +
                      DateFormat('HH:mm:ss a').format(selectedTime),
                  style: TextStyle(fontSize: 24),
                ),
                trailing: MaterialButton(
                  child: Text("Update Waktu"),
                  onPressed: () async {
                    final TimeOfDay? timeOfDay = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(selectedTime),
                    );
                    if (timeOfDay != null) {
                      setState(() {
                        selectedTime = DateTime(
                          selectedTime.year,
                          selectedTime.month,
                          selectedTime.day,
                          timeOfDay.hour,
                          timeOfDay.minute,
                        );
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Pilih Timezone saat ini',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              child: DropdownButtonFormField<String>(
                value: selectedTimezone,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  border: InputBorder.none,
                ),
                items: timezones.entries.map((entry) {
                  return DropdownMenuItem(
                    value: entry.value,
                    child: Text(entry.key),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTimezone = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Hasil Konversi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: timezones.entries.map((entry) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(entry.key),
                          Text(
                            getFormattedTime(entry.value),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
