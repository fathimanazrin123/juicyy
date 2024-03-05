import 'package:flutter/material.dart';
import 'package:juicejuice/fourth.dart';

import 'fifth.dart';

class ProductItem extends StatefulWidget {
  final pName;
  final pSize;
  final pPrice;
  final pImage;
  final Function(int) updateItemCount;
  ProductItem({
    super.key,
    required this.pName,
    required this.pSize,
    required this.pPrice,
    required this.pImage,
    required this.updateItemCount,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.none),
          ),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                fourthPage())); // Replace 'fourth' with the actual route name
                  },
                  child: SizedBox(
                    height: 100,
                    child: Image.network(widget.pImage),
                  ),
                ),
                Text(
                  widget.pName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'RS - ${widget.pPrice}',
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Size - ${widget.pSize}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Row(children: [
                          IconButton(
                              onPressed: () {
                                if (itemCount > 0) {
                                  setState(() {
                                    itemCount--;
                                  });
                                }
                              },
                              icon: Icon(Icons.remove)),
                          Text(itemCount.toString()),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  itemCount++;
                                });
                              },
                              icon: Icon(Icons.add)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart(
                                              productName: widget.pName,
                                              productSize: widget.pSize,
                                              productImage: widget.pImage,
                                              itemCount: itemCount,
                                            )));
                              },
                              child: Text(
                                'ADD TO CART',
                                style: TextStyle(backgroundColor: Colors.red),
                              )),
                        ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
