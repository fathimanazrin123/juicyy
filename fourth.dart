import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';

class fourthPage extends StatelessWidget {
  const fourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

int _currentIndex = 0;
int simpleIntInput = 0;
final List<String> images = [
  'https://www.bigbasket.com/media/uploads/p/l/40073723_3-raw-pressery-cold-extracted-juice-life.jpg',
  'https://freshclub.co.in/cdn/shop/products/pomegranate_250ml_p1_1n.jpg?v=1655986819',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj0j7HXaO2V1ZVw4Rjm0J9MX6CSDtoRt_OkQdLe_kYOlA7yDywecgiXlSRnr9h4dozde8&usqp=CAU',
  'https://www.bigbasket.com/media/uploads/p/l/40073723_3-raw-pressery-cold-extracted-juice-life.jpg',
  'https://m.media-amazon.com/images/I/51pHivF2gnS._AC_UF1000,1000_QL80_.jpg'
];

class AppBarExample extends StatefulWidget {
  const AppBarExample({super.key});
  @override
  State<AppBarExample> createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {
  int _currentIndex = 0;
  int simpleIntInput = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Details'),
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
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 3)], color: Colors.white),
              ),
              Column(
                children: [
                  CarouselSlider(
                    items: images.map((item) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      aspectRatio: 16 / 9,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: images.asMap().entries.map((entry) {
                        int index = entry.key;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      'Raw pomegranate',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    'size',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 640),
                    child: Row(
                      children: [
                        QuantityInput(
                          iconColor: Colors.grey,
                          buttonColor: Colors.white,
                          value: simpleIntInput,
                          onChanged: (value) => setState(() => simpleIntInput =
                              int.parse(value.replaceAll(',', ''))),
                        ),
                        Text(' $simpleIntInput',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 29)),
                        Icon(Icons.clear),
                        Icon(Icons.currency_rupee),
                        Text(
                          '79',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: SizedBox(
                      height: 40,
                      width: 250,
                      child: ElevatedButton(
                          onPressed: () {
                            //  Navigator.push(context,MaterialPageRoute(builder: (context)=>
                            //  Cart( productName: widget.pName,
                            //                      productSize: widget.pSize,
                            //                      productImage: widget.pImage,
                            //                      itemCount: itemCount,)));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: Text(
                            'ADD TO CART',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(
                          'SUBSCRIBE',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 160, top: 16),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      'Who does not love a chilled glass of fruit juice on a hot summer day? And Real Fruit Juice-mixed Fruits is not just delicious and refreshing, but it is also filled with the goodness of 9 different fruits. Devoid of preservatives and artificial ingredients, this mixed fruit juice is a fine source',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 160, top: 16),
                    child: Text(
                      'Nutrition Facts',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Column(
                      children: [
                        Text("Vitamin C:                       50% "),
                        Text('Cholestrol                          20g'),
                        Text('Sodium                              20g'),
                        Text('Carbohydrate                        18g'),
                        Text('Protein                                3g'),
                        Text('Fat                                 0.5g'),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
