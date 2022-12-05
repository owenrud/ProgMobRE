import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_demo1/mahasiswa/mahasiswa_add.dart';

class getMahasiswa extends StatefulWidget {
  const getMahasiswa({Key? key}) : super(key: key);

  @override
  State<getMahasiswa> createState() => _getMahasiswaState();
}


class _getMahasiswaState extends State<getMahasiswa> {
  List _get = [];

  Future _getDataMhs() async{
    try{
      final response = await http.get(Uri.parse(
    'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200371'
    ));
    if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    setState((){
      _get = data;
    });
    }
    }catch(e){}
  }


  @override
  void initState() {
    super.initState();
    _getDataMhs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Mahasiswa"),
      ),
      body: ListView.builder(
          itemCount: _get.length,
          itemBuilder: (context,index){
            return Padding(padding: const EdgeInsets.all(10),
        child: ListTile(
      shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(5),
      ),
          title: Text(_get[index]['nim']+ "-" + _get[index]['nama']),
          subtitle: Text(_get[index]['email']),
      ),
      );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder:(context)=>addMahasiswa())
          );
        },
      ),
    );
  }
}
