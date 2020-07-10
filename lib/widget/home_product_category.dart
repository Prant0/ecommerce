import 'package:ecommerce/model/cata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeProductCategory extends StatefulWidget {
  final List<Cata> categoryList;
  HomeProductCategory({this.categoryList});

  @override
  _HomeProductCategoryState createState() => _HomeProductCategoryState();
}

class _HomeProductCategoryState extends State<HomeProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 185.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.categoryList.length,
        physics:BouncingScrollPhysics() ,
        itemBuilder: (context,index){
          return Container(
            height: 150.0,
            width: 150.0,
            child: Card(
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  Image.network(
                    this.widget.categoryList[index].icon,
                    width: 150.0,height: 145.0,fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(this.widget.categoryList[index].name),
                  )

                ],
              ),
            ),

          );
        }
      ),

    );
  }
}
