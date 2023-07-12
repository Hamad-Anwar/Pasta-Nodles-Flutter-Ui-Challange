import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui_challange/Utils/BottonWidget.dart';
import 'package:ui_challange/Utils/custom_text.dart';
import 'package:ui_challange/View/DetailScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  cardLists(),
                  customBar(),
                  customOpacity(),
                ],
              ),
            ),
            cartList()
          ],
        ),
      ),
    );
  }



  Widget customBar(){
    return Container(
      height: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
                // Colors.white,
                Colors.white.withOpacity(.0)
              ])),
      child:  Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 20,
            ),
            Custom_Text(txt: "Pasta & Noodles", size: 20, weight: FontWeight.bold, color: Colors.black),
            const Icon(
              Icons.lightbulb_outline_rounded,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
  Widget cardLists(){
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: [
                  itemCards("Seggiano Organic Tagliatele",
                      "Assets/Images/1.jpeg", "7.99", "500g"),
                  itemCards("Rummo Fusilli No 48 Pasta",
                      "Assets/Images/2.jpeg", "5.6", "500g"),
                  itemCards("Biona Organic White Spelt Fusilli",
                      "Assets/Images/3.jpeg", "8.10", "500g"),
                  itemCards("Seggiano Organic Tagliat",
                      "Assets/Images/4.jpeg", "10.99", "500g"),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),

                  itemCards("Segano Organic Tagliatelle",
                      "Assets/Images/4.jpeg", "10.99", "500g"),
                  itemCards("Sano Organic Tagliatelle",
                      "Assets/Images/3.jpeg", "10.99", "500g"),
                  itemCards("Seggian Organic Tagliatelle",
                      "Assets/Images/2.jpeg", "10.99", "500g"),
                  itemCards("Seggiano Orgnic Tagliatelle",
                      "Assets/Images/1.jpeg", "10.99", "500g"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget customOpacity(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Hero(
        tag: "TRY",
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(.0),
                    Colors.white.withOpacity(.0),
                    Colors.white.withOpacity(.0),
                  ])),
        ),
      ),
    );
  }
  Widget cartList(){
    return Container(
        height: 100,
        width: double.infinity,
        color: Colors.black,
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Row(children: [
          Custom_Text(txt: "Cart", size: 25, weight: FontWeight.bold, color: Colors.white),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ListData.list.map((e) => e).toList(),
                ),
              )),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.amber,
            child: Center(
                child: Text(
                  ListData.list.length.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          )
        ]));
  }
  Widget itemCards(String name,String image,String price,String kg){
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Card(
        elevation: 10,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          height: 250,
          width: MediaQuery.sizeOf(context).width / 2.28,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                Details(
                                    image: image,
                                    name: name,
                                    price: price,
                                    kg: kg),
                          ));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Hero(
                          tag: name,
                          child: Image.asset(
                            image,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        )),
                  )),
              Custom_Text(txt: "\$$price", size: 25, weight: FontWeight.bold, color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              Custom_Text(txt: name, size: 14, weight: FontWeight.bold, color: Colors.black),
              const SizedBox(
                height: 5,
              ),
              Custom_Text(txt: kg, size: 13, weight: FontWeight.bold, color: Colors.grey)
            ],
          ),
        ),
      ),
    );
  }

}
