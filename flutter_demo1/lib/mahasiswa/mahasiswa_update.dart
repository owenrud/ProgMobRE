import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class updateMahasiswa extends StatefulWidget {
  const updateMahasiswa({Key? key,required this.nim,required this.id}) : super(key: key);

 final String nim;
 final String id;

  @override
  State<updateMahasiswa> createState() => _updateMahasiswaState();
}

class _updateMahasiswaState extends State<updateMahasiswa> {
  final _formKey = GlobalKey<FormState>();
  List _get = [];
  Future<List>? resp;

  TextEditingController idController = new TextEditingController();
  TextEditingController namaController = new TextEditingController();
  TextEditingController nimController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nimprogmobController = new TextEditingController();
  TextEditingController fotoController = new TextEditingController();

  Future _getDataMhs() async{
    try{
      final response = await http.get(Uri.parse(
          'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200371'
      ));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        setState((){
          _get.clear();
          _get = data;
        });
      }
    }catch(e){}
  }
  void initState(){
    super.initState();
    _getDataMhs();
    idController.text = widget.id;
    nimController.text = widget.nim;
    nimprogmobController.text = widget.nim;
  }

  Future<List> updateMhs(String id,nama,nim,alamat,email,foto,nim_progmob) async {
    final http.Response response = await http.post(
      Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/update'),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'id' : id,
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
              controller: idController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
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
                  return 'hadeh';
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
                    resp = updateMhs(idController.text,namaController.text, nimController.text, alamatController.text, emailController.text,
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
