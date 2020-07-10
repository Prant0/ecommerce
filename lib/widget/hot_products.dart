import 'package:flutter/material.dart';

class HotProduct extends StatefulWidget {
  final String productName;
  final String photo;
  final int productPrice;
  final int productDiscount;

  HotProduct(this.productName,this.photo,this.productPrice,this.productDiscount);


  @override
  _HotProductState createState() => _HotProductState();
}

class _HotProductState extends State<HotProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 165.0,
      child: Column(
        children: <Widget>[
          Text(this.widget.productName),

          Image.network(widget.photo),

          Row(
            children: <Widget>[
              Text("Price : ${this.widget.productPrice}"),
              Text("Price : ${this.widget.productDiscount}"),
            ],
          ),
        ],
      ),
    );
  }
}
