import 'package:cybershop/response/productResponse.dart';
import 'package:cybershop/util/url.dart';
import 'package:dio/dio.dart';

class ProductAPI {
  Future<ProductResponse?> getproduct(String? search) async {
    Future.delayed(const Duration(seconds: 2), () {});
    ProductResponse? productResponse;
    Response response;

    try {
      var dio = Dio();
      //  dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: "http://www.localhost:5000")).interceptor);
      var url = baseUrl + getProductsUrl;
      response = await dio.get(url, queryParameters: {'keyword': search}
          //  ,options: buildCacheOptions(Duration(days: 7))
          );

      if (response.statusCode == 200) {
        print(response.data);
        productResponse = ProductResponse.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
    return productResponse;
  }
}
