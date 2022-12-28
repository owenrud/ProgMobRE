import 'package:flutter/material.dart';
import 'package:flutter_demo1/mahasiswa/mahasiswa_update.dart';
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
    'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200371/'
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

  Future _delMhs(String id,nim_progmob) async {
    final http.Response response = await http.post(
      Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/delete'),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'nim_progmob': nim_progmob
      }),
    );
    if (response.statusCode == 200) {
      _getDataMhs();
    } else {
      throw Exception('Failed to load response');
    }
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
      body: RefreshIndicator(
        onRefresh: _getDataMhs,
        child: ListView.builder(
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
                  trailing: PopupMenuButton(
                    onSelected: (result) {
                      if (result == "edit") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => updateMahasiswa(nim:_get[index]['nim'].toString(),id: _get[index]['id'].toString(),)),
                        );
                      }
                    },
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context){
                      return[
                        PopupMenuItem(
                          value: "edit",
                          child: Text("Edit"),

                        ),
                        PopupMenuItem(
                          value: "delete",
                            child: Text("Delete"),
                          onTap: ()async{
                            _delMhs(_get[index]['id'].toString(), '72200371');
                          },
                        ),
                      ];
                    },
                  ),
                ),
              );
            }),

      ),
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
