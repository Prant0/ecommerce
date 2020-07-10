import 'package:ecommerce/repository/repository.dart';
import 'package:flutter/material.dart';

class ProductService{
  Repository _repository;

  ProductService(){
    _repository = Repository();
  }

  getHotProducts()async{
    return await _repository.httpGet('get-all-hot-products');
  }

}