import 'package:flutter/material.dart';
import 'package:flutter_demo1/mahasiswa/mahasiswa_get.dart';

void main() {
  runApp(const Home());
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Aplikasi")),
        drawer: Drawer(
         child: ListView(
           children: [
             UserAccountsDrawerHeader(
               currentAccountPicture: CircleAvatar(
                 backgroundImage: AssetImage("images/logo.png"),
               ),
                 accountName: Text("Aplikasi UAS"),
                 accountEmail: Text("Aplikasi CRUD Matakuliah")),

             ListTile(
               leading: Icon(Icons.access_alarm_rounded),
               title: Text("Pertemuan 1"),
               onTap: (){
                 Navigator.pop(context);
               },
             ),
              ListTile(
                leading: Icon(Icons.account_box_sharp),
                title: Text("Pertemuan 13"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
             ListTile(
               leading: Icon(Icons.add_call),
               title: Text("Card view"),
               onTap: (){
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading: Icon(Icons.account_box_rounded),
               title: Text("Mahasiswa"),
               onTap: (){
                 Navigator.push(
                     context,
                 MaterialPageRoute(builder:(context)=>getMahasiswa())
                 );
               },
             ),
           ],
         ),
        ),
      body: ListView(
        children: [
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
        ],
      ),// Add a Drawer here in the next step.
    );
  }

  Card buildCard() {
    return Card(
          color: Colors.amber,
          elevation: 8,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.ad_units_outlined),
                title: Text("Lorem Ipsum is simply dummy text of the p"),
                subtitle: Text("Lorem Ipsum is simply dummy text of the p"),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: (){},
                      child:Text("Buy Ticket")
                  ),
                  TextButton(
                      onPressed: (){},
                      child:Text("Listen")
                  ),
                ],
              )
            ],
          ),
        );
  }

  Container buildContainer() {
    return Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0
            ),
          ),
          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        padding: EdgeInsets.all(8.0)
        );
  }
}
