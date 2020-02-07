import 'package:flutter/material.dart';
import 'package:mastering_payments/services/styles.dart';

import 'custom_text.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const ProductCard({Key key,@required this.name,@required this.price, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: green[200],
                  offset: Offset(2, 1),
                  blurRadius: 5
              )
            ]
        ),
        child: ListTile(
          onTap: (){
            Navigator.pop(context);
          },
          leading: Image.asset('images/$image', width: 80, height: 80,),
          title: Text(name),
          subtitle: Text("\$${price.toString()}"),
          trailing: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: green
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: CustomText(msg: "Buy", color: white,),
            ),
          ),
        ),
      ),
    );
  }
}
