import 'package:flutter/material.dart';
import 'list.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Profile'),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.calendar_month),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.alarm),
            ),
            Icon(Icons.shop)
          ],
        ),
        body: Container(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsLzyNW5_di3TguKUULQiSue6CnCVmBPDbXGLVHtb1lp7wApq2VUp5Gxu8CbyCi3nH2gw&usqp=CAU'),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Fathima Nazrin',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('Wallet Balance:'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 28),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(textItemmm[index]),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400),
              child: ListTile(
                title: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        //Navigator.push(context,MaterialPageRoute(builder: (context)=>PasswordUpdateForm()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          side: BorderSide(color: Colors.red)),
                      child: Text(
                        'Add New Address',
                      )),
                ),
              ),
            )
          ]),
        ));
  }
}
