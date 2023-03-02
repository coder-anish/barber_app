import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class ShippngScreen extends StatefulWidget {
  const ShippngScreen({super.key});

  @override
  State<ShippngScreen> createState() => _ShippngScreenState();
}

class _ShippngScreenState extends State<ShippngScreen> {
  String dateTime = '';
  @override
  Widget build(BuildContext context) {
    var address = TextEditingController();
    var phone = TextEditingController();
    var country = TextEditingController();
    var state = TextEditingController();
    var zipcode = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick the date and time'),
        elevation: 4.0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 14, 234, 117),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pick the date and time',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Appointment Date',
                  timeLabelText: "Time",
                  selectableDayPredicate: (date) {
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }
                    return true;
                  },
                  onChanged: (val) => {
                    setState(() {
                      dateTime = val;
                    })
                  },
                  validator: (val) {
                    print(dateTime);
                    return null;
                  },
                  onSaved: (val) => print(val),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    labelText: 'Street Address',
                    // hintText: '1234 Main St',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    // hintText: '555-555-5555',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: country,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    // hintText: 'Nepal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: state,
                  decoration: InputDecoration(
                    labelText: 'State',
                    // hintText: 'Bagmati',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: zipcode,
                  decoration: InputDecoration(
                    labelText: 'Zip Code',
                    // hintText: '90210',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/confirm_order', arguments: {
                      'address': address.text,
                      'phone': phone.text,
                      'country': country.text,
                      'state': state.text,
                      'zip': zipcode.text,
                      'dateTime': dateTime,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 14, 234, 117),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 13.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    "Confirm Appointment",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
