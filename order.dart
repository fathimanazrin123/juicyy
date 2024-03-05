import 'package:flutter/material.dart';
import 'package:juicejuice/wallet.dart';

class appsc extends StatefulWidget {
  const appsc({super.key});

  @override
  State<appsc> createState() => _appscState();
}

class _appscState extends State<appsc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(244, 54, 54, 1),
        title: Text('Order'),
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
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => wallet()));
                },
                child: Row(
                  children: [
                    Icon(Icons.wallet),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Wallet(Balance:)'),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.mouse),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Net Banking'),
                )
              ],
            ),
            Divider(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.card_giftcard),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Card Payment'),
                ),
              ],
            ),
            Divider(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.delivery_dining),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Cash on Delivary'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>wallet()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text(
                      'PROCEED TO PAY',
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
