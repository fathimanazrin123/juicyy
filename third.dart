import 'package:flutter/material.dart';
import 'package:juicejuice/init.dart';
import 'package:juicejuice/productrespo.dart';
import 'package:juicejuice/profile.dart';
import 'package:juicejuice/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apithird.dart';

class Fmrad extends StatefulWidget {
  const Fmrad({
    Key? key,
  }) : super(key: key);

  @override
  State<Fmrad> createState() => _LoginUserState();
}

class _LoginUserState extends State<Fmrad> {
  final List<IconData> icons = [
    Icons.home,
    Icons.shop,
    Icons.wallet,
    Icons.account_balance,
    Icons.subscriptions,
    Icons.notifications,
    Icons.format_quote,
  ];

  final List<String> textItems = [
    'Shop',
    'My order',
    'My Wallet',
    'My account',
    'My Subscribtion',
    'Notification',
    'FAQs',
  ];

  @override
  void initState() {
    super.initState();
    ApiClass.instance.getProducts();
  }

  void navigateprofile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Fressery'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.calendar_month),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shop),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ApiClass.instance.productNotifier,
          builder: (context, List<Datum> newProduct, _) {
            return GridView.count(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: List.generate(newProduct.length, (index) {
                final product = newProduct[index];
                return ProductItem(
                  pName: product.pname,
                  pSize: product.size,
                  pPrice: product.prize,
                  pImage: product.image,
                  updateItemCount: (int) {},
                );
              }),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  onTap: navigateprofile,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsLzyNW5_di3TguKUULQiSue6CnCVmBPDbXGLVHtb1lp7wApq2VUp5Gxu8CbyCi3nH2gw&usqp=CAU',
                    ),
                  ),
                ),
                accountName: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Fathima Nazrin',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                accountEmail: Text('Wallet Balance'),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(icons[index]),
                  title: Text(textItems[index]),
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('email');
                await prefs.remove('password');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Second3()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'LOG OUT',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
