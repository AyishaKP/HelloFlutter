
import 'package:hello_flutter/entities/Products.dart';
import 'package:hello_flutter/repository/BaseRepository.dart';

class MockRepository extends BaseRepository {

  @override
  Future<Products> getProducts(String page) {
    return null;
  }

}