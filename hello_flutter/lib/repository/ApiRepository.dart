import 'package:hello_flutter/entities/Products.dart';
import 'package:hello_flutter/repository/BaseRepository.dart';
import 'package:hello_flutter/data/DashboardAPIManager.dart';
class ApiRepository extends BaseRepository {
 
@override
  Future<Products> getProducts(String page) async {
    //todo change here
    return DashboardApiManager()
        .getHomeAPI(page)
        .then((onValue) => Products.fromJson(onValue));
  }


}
