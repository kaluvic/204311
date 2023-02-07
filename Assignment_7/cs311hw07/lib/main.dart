import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAddressForm(),
    );
  }
}

class MyAddressForm extends StatefulWidget {
  const MyAddressForm({super.key});

  @override
  State<MyAddressForm> createState() => _MyAddressFormState();
}

class _MyAddressFormState extends State<MyAddressForm> {
  final _formKey = GlobalKey<FormState>();
  final animal = ['cat', 'dog', 'fish'];
  final emailForm = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            validator: (email) {
              if (emailForm.hasMatch(email!)) {
                return null;
              } else {
                return 'Incorrect Email';
              }
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Zip Code'),
            validator: (zipCode) {
              if (zipCode!.startsWith('0') &&
                  zipCode.length != 5 &&
                  RegExp(r"^[a-zA-Z]*").hasMatch(zipCode)) {
                return 'Incorrect Zip Code';
              }
              return null;
            },
          ),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return animal.where((String value) {
                return value.contains(textEditingValue.text.toLowerCase());
              });
            },
          ),
          ElevatedButton(
              onPressed: (() {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing')));
                }
              }),
              child: const Text('Submit'))
        ]),
      ),
    );
  }
}
