import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_challange/Utils/BottonWidget.dart';
import 'package:ui_challange/Utils/custom_text.dart';
import 'package:ui_challange/View/Home.dart';

class Details extends StatefulWidget {
  String name,image,price,kg;
  Details({super.key,required this.image,required this.name,required this.price,required this.kg});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  String about="Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source";
  bool temp=false;
  double opacity=0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration.zero, () {
      setState(() {
        opacity=1.0;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
          child: Stack(
            children: [
              Positioned(child: Hero(
                tag: "TRY", child: Container(),
              )),
              Positioned.fill(
                  child: displayData()),
              Align(alignment: Alignment.bottomCenter,
              child: bottomRow(),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
  Widget displayData(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: temp?widget.price :widget.name,
            child: Image.asset(widget.image,
              height: MediaQuery.sizeOf(context).height/2.5,
            ),
          ),
          AnimatedOpacity(opacity: opacity,
            duration: const Duration(milliseconds: 500)
            ,child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(txt: widget.name, size: 40, weight: FontWeight.bold, color: Colors.black),
                Custom_Text(txt: widget.kg, size: 14, weight: FontWeight.bold, color: Colors.grey),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.shade500)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.add),
                            Text("1",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            Icon(Icons.remove)
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "\$${widget.price}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Custom_Text(txt: "About this product", size: 20, weight: FontWeight.bold, color: Colors.black),
                const SizedBox(height: 10,),
                Custom_Text(txt: about, size: 15, weight: FontWeight.normal, color: Colors.black)
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget bottomRow(){
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
                Colors.white.withOpacity(.0),
              ]
          )
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20,),
            const Icon(Icons.favorite_border,color: Colors.black,size: 25,),
            Expanded(child: InkWell(
              onTap: () async {
                setState(() {
                  temp=true;
                });
                ListData.list.add(
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Hero(
                        tag: widget.price,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(widget.image),
                        ),
                      ),
                    )
                );
                setState(() {
                  opacity=0.0;
                });
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) => const Home(),
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                ));
              },
              child: Container(
                height: 60,
                margin: const EdgeInsets.only(left: 40,right: 15),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(40)
                ),
                child: const Center(
                  child: Text("Add to cart",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
