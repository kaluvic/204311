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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddressForm(),
    );
  }
}

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => MyForm();
}

class MyForm extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final fruits = ['Apple', 'Banana', 'Dog'];
  late String _fruit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(label: Text('text')),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'input please';
              }
              return null;
            },
            controller: nameController,
          ),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return fruits.where((String value) {
                return value.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              _fruit = selection;
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('text')));
                }
              },
              child: const Text('submit'))
        ],
      ),
    ));
  }
}
