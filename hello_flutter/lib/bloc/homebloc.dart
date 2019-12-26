import 'dart:async';
import 'package:hello_flutter/repository/BaseRepository.dart';

import 'NativeBlockProvider.dart';
import 'package:hello_flutter/entities/Products.dart';
import 'package:hello_flutter/dipendency/DependencyInjection.dart';



class HomeBloc extends BlocBase {
  StreamController<Products> _productStreamController = StreamController<Products>.broadcast();
  Sink<Products> get updateProduct => _productStreamController.sink;
  Stream<Products>get myProducts => _productStreamController.stream;
  
  HomeBloc() {
    init();
  }
  init() {
    

  }
@override
  void dispose() {
    _productStreamController.close();
  }

getProducts() async {
  BaseRepository base = Injector().getRepository;
  base.getProducts('PAGED=1&IW=295&IH=295&PER_PAGE=20').then((onValue) {
    updateProduct.add(onValue);
  }).catchError((onError) {
    _productStreamController.addError(onError.toString());

  });
}
  
}