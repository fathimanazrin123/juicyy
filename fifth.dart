import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cart extends StatefulWidget {
  final String productName;
  final String productSize;
  final String productImage;
  final int itemCount;
  Cart({
    required this.productName,
    required this.productSize,
    required this.productImage,
    required this.itemCount,
  });

  @override
  State<Cart> createState() => _fifthState();
}

class _fifthState extends State<Cart> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate)
      setState(() {
        startDate = picked;
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate)
      setState(() {
        endDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('Cart')),
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
        color: Colors.white,
        child: Column(
          children: [
            Image.network(
              widget.productImage,
              height: 100,
            ),
            Text(' ${widget.productName}'),
            Text(' ${widget.productSize}'),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Row(
                children: [
                  Icon(Icons.remove),
                  Text('${widget.itemCount}'),
                  Icon(Icons.add)
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Start Date'),
                    Text(' ${dateFormat.format(startDate)}',
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => _selectStartDate(context),
                  child: Icon(Icons.calendar_today_rounded),
                ),
                // SizedBox(height: 20.0),
                Column(
                  children: [
                    Text('End Date'),
                    Text(
                      ' ${dateFormat.format(endDate)}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => _selectEndDate(context),
                    child: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180, top: 40),
              child: Text('Shipping Address '),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  hintText: 'Enter Your Address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 190),
              child: Text('Coupon Code'),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Code',
                  hintText: 'Enter your Code',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Text('Bill Total:2580'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Text('Discount:580'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Text(
                'Grand Total :2000',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                  height: 45,
                  width: 260,
                  child: ElevatedButton(
                      onPressed: () {
                        // appsc()  Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                      },
                      child: Text('PAY NOW'))),
            )
          ],
        ),
      ),
    );
  }
}
