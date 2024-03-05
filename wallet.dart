import 'package:flutter/material.dart';

class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Wallet'),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '2345',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('wallet balance'),
                ),
                OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Recharge Wallet',
                      style: TextStyle(color: Colors.black),
                    )),
                Text(
                  'Transfer wallet Amount',
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150, top: 58),
                  child: Text('MY TRANSACTIONS'),
                ),
                ListTile(
                  title: Text('2000'),
                  subtitle: Text('17 july 2023, 2:30 pm'),
                ),
                ListTile(
                  title: Text('2000'),
                  subtitle: Text('17 july 2023, 2:30 pm'),
                ),
                ListTile(
                  title: Text('2000'),
                  subtitle: Text('17 july 2023, 2:30 pm'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
