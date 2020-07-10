import 'package:ecommerce/repository/repository.dart';
import 'package:flutter/material.dart';

  class CategoreiService{
    Repository _repository;

    CategoreiService(){
      _repository = Repository();
    }

    getCategori( ) async{
      return await _repository.httpGet('categories');
    }


  }