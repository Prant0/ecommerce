import 'package:ecommerce/model/hot_product.dart';
import 'package:ecommerce/widget/hot_products.dart';
import 'package:flutter/material.dart';

class HomeHotProducts extends StatefulWidget {
  final List<Product>productList;
  HomeHotProducts({this.productList});

  @override
  _HomeHotProductsState createState() => _HomeHotProductsState();

}

class _HomeHotProductsState extends State<HomeHotProducts> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
      height: 200.0,
      child: ListView.builder(
       scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: this.widget.productList.length,
        itemBuilder: (context,index){
            return Container(
              height: 150.0,
              width: 150.0,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Text(this.widget.productList[index].name,style: TextStyle(fontWeight: FontWeight.w600)),
                    Image.network(
                      this.widget.productList[index].photo,
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Price : ${this.widget.productList[index].price}',
                        style: TextStyle(fontWeight: FontWeight.w600),),
                        Text('  Dis : ${this.widget.productList[index].discount}',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            );




          //this.widget.productList[index].name,
             // this.widget.productList[index].photo,
              //this.widget.productList[index].price,
             // this.widget.productList[index].discount,



        },
      ),
    );
  }
}
