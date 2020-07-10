import 'dart:convert';
import 'package:ecommerce/model/cata.dart';
import 'package:ecommerce/model/hot_product.dart';
import 'package:ecommerce/serviee/categories_service.dart';
import 'package:ecommerce/serviee/hot_product_service.dart';
import 'package:ecommerce/serviee/slider_service.dart';
import 'package:ecommerce/widget/carousel_slider.dart';
import 'package:ecommerce/widget/home_hot_product.dart';
import 'package:ecommerce/widget/home_product_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var items= [];
    SliderService _sliderService = SliderService();
    ProductService _productService = ProductService();
    CategoreiService _categoreiService = CategoreiService();


   List<Cata> _categoryListt = List<Cata>();
   List<Product> _productList = List<Product>();


    @override
  void initState() {
    super.initState();
    _getAllSliders();
    _getAllCategorie();
    _getAllHotProducts();
  }

    _getAllSliders()async{
      var sliders = await _sliderService.getSlider();   //object er method k call korce
      var result = json.decode(sliders.body);

      result['data'].forEach((data){
        setState(() {
          items.add(NetworkImage(data['image_url']));
        });
      });
      print(result);
    }

    _getAllCategorie()async {
      var categories = await _categoreiService.getCategori();
      var result = json.decode(categories.body);
      result["data"].forEach((data){

        var model = Cata();
        model.id=data['id'];
        model.name=data['categoryName'];
        model.icon=data['categoryIcon'];
        setState(() {
          _categoryListt.add(model);
        });
      });

    }

    _getAllHotProducts()async{
      var hotProducts = await _productService.getHotProducts();
      var result = json.decode(hotProducts.body);
      result['data'].forEach((data){
        var model = Product();
        model.id=data['id'];
        model.name=data['name'];
        model.photo=data['photo'];
        model.price=data['price'];
        model.discount=data['discount'];
        setState(() {
          _productList.add(model);
        });
      });
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 12.0,
        title: Text(' Ecommerce App',style: TextStyle(fontSize: 22.0),),

        backgroundColor: Colors.red,
      ),


      body: Container(
        child: ListView(
          children: <Widget>[
            carouselSlider(items),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10.0),
              child: Center(
                child: Text('  Product Category',style: TextStyle(
                    fontSize: 18.0,fontWeight: FontWeight.w500
                ),),
              ),
            ),

            HomeProductCategory(categoryList: _categoryListt,)  , // recieve data from another page

            Container(
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 12.0),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12.0),
                child: Center(
                  child: Text('  Hot Product',style: TextStyle(
                      fontSize: 20.0,fontWeight: FontWeight.w800,color:Colors.red
                  ),),
                ),
              ),
            ),

            HomeHotProducts(productList: _productList),

          ],
        ),
      ),
      );




  }
}
