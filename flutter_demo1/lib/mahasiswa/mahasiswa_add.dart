import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class addMahasiswa extends StatefulWidget {
  const addMahasiswa({Key? key}) : super(key: key);

  @override
  State<addMahasiswa> createState() => _addMahasiswaState();
}

class _addMahasiswaState extends State<addMahasiswa> {
  final _formKey = GlobalKey<FormState>();
  Future<List>? resp;

  TextEditingController namaController = new TextEditingController(text:'Nama');
  TextEditingController nimController = new TextEditingController(text:'Nim');
  TextEditingController alamatController = new TextEditingController(text:'alamat');
  TextEditingController emailController = new TextEditingController(text:'email');
  TextEditingController nimprogmobController = new TextEditingController(text:'Nimprogmob');
  TextEditingController fotoController = new TextEditingController(text:'foto');

  Future<List> sendMhs(String nama,nim,alamat,email,foto,nim_progmob) async {
    final http.Response response = await http.post(
      Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/create'),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'nama': nama,
        'nim': nim,
        'alamat': alamat,
        'email': email,
        'foto': foto,
        'nim_progmob': nim_progmob
      }),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load response');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Mahasiswa"),
      ),
      body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: namaController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: nimController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: alamatController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: fotoController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: nimprogmobController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  resp = sendMhs(namaController.text, nimController.text, alamatController.text, emailController.text,
                      fotoController.text, nimprogmobController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    ),
    );
  }


}
