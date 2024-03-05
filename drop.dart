import 'package:flutter/material.dart';
import 'list.dart';

class drop extends StatefulWidget {
  const drop({super.key});

  @override
  State<drop> createState() => _dropState();
}

class _dropState extends State<drop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsLzyNW5_di3TguKUULQiSue6CnCVmBPDbXGLVHtb1lp7wApq2VUp5Gxu8CbyCi3nH2gw&usqp=CAU'),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Fathima Nazrin'),
                    subtitle: Text('Wallet Balance:'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 40),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Icon(
                              icons[index],
                              color: Colors.black,
                            ),
                            title: Text(textItems[index]),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
