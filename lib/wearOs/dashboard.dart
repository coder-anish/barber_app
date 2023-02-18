import 'package:cybershop/models/products.dart';
import 'package:cybershop/repository/productRepository.dart';
import 'package:cybershop/response/productResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:wear/wear.dart';

class AllProduct extends StatefulWidget {
  static String routeName = '/get_all_product';
  const AllProduct({Key? key}) : super(key: key);
  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List<Product> lstproducts = [];
  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(
        builder: (context, mode, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                FutureBuilder<ProductResponse?>(
                    future: ProductRepository().getproducts(""),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          lstproducts = snapshot.data!.products!;
                          return Column(
                            children: [
                              Text(
                                "All Products",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              for (var i = 0; i < lstproducts.length; i++)
                                Card(
                                  child: ListTile(
                                    leading: Image.network(
                                      lstproducts[i].images![0].url.toString(),
                                      height: 30,
                                    ),
                                    title: Text(
                                      lstproducts[i].name.toString(),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    subtitle: Text(
                                      lstproducts[i].price.toString(),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }
                      } else if (snapshot.hasError) {
                        return Text("dgasg");
                      }
                      return const Center(
                        child: CupertinoActivityIndicator(
                          radius: 10,
                        ),
                      );
                    })
              ]),
            ),
          );
        },
      );
    });
  }
}
