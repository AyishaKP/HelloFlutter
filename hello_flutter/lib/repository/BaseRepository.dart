import 'package:hello_flutter/entities/Products.dart';

abstract class BaseRepository {
  
  Future<Products> getProducts(String page);
  
}
