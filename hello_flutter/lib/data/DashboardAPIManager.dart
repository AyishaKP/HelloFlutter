import 'package:hello_flutter/data/HttpManager.dart';
import 'package:hello_flutter/data/constant_network.dart';

class DashboardApiManager {
  Future<dynamic> getHomeAPI(String page) async {
    return apiManager.makeRequest(HttpMethods.GET, APIs().apiHomeWithPage(page), null);
  }

  //  Future<dynamic> addToCart(String hash) async {
  //   return apiManager.makeRequest(HttpMethods.POST, APIs().addToCart, {"hash":hash});
  // }
}
