
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cybershop/models/products.dart';
import 'package:cybershop/repository/productRepository.dart';
import 'package:cybershop/response/productResponse.dart';
import 'package:cybershop/utils/productcard.dart';
import 'package:cybershop/utils/sideNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "https://d1593xiyv01mio.cloudfront.net/gb/cms_content/34/bd7e65e8124a47708114355e7651f276.png",
    "https://d1593xiyv01mio.cloudfront.net/gb/cms_content/34/bd7e65e8124a47708114355e7651f276.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQi0zsUp3jZMQ9E39Q-PPIKwW1S10Jo-8Xf1U7Fjliii_0VbICK0RhFeahJn_Zgur_kIU&usqp=CAU"
  ];

  // make String dynamci list of product type

  String? search;

  int activeimage = 0;
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeimage,
        count: images.length,
        effect: const JumpingDotEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Colors.red,
            dotColor: Colors.black12),
      );
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  Widget build(BuildContext context) {
    // logout();
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: SizedBox(
          height: 30,
          child: TextField(
            onChanged: (Value) {
              setState(() {
                search = Value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 238, 233, 233),
              prefixIcon:
                  const Icon(Icons.search, color: Colors.black, size: 16),
              hintText: 'Find services of TrimMe',
              hintStyle: const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 18, 72, 211)),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 14, 46, 189)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
         
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),

          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              viewportFraction: 0.98,
              autoPlay: true,
            ),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: CachedNetworkImage(
                      imageUrl: i,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          // category section

          const SizedBox(
            height: 15,
          ),

          const SizedBox(
            height: 10,
          ),

          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text("TrimMe Services ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 8, 83))),
          ),

          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: FutureBuilder<ProductResponse?>(
              future: ProductRepository().getproducts(search),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    ProductResponse productResponse = snapshot.data!;
                    List<Product> lstproducts = snapshot.data!.products!;
                    print(snapshot.data!.products!);
                    return GridView.builder(
                        shrinkWrap: true,
                        primary: true,
                        itemCount: lstproducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            productName: lstproducts[index].name.toString(),
                            productPrice: lstproducts[index].price.toString(),
                            productImagePath: lstproducts[index]
                                    .images![0]
                                    .url ??
                                "https://res.cloudinary.com/kingsly/image/upload/v1676963431/lk_fx0mbs.png",
                            onPressed: () {
                              print('cccc ${lstproducts[index].reviews}');
                              Navigator.pushNamed(context, '/new', arguments: {
                                "images": lstproducts[index].images![0].url,
                                "name": lstproducts[index].name,
                                "price": lstproducts[index].price,
                                "description": lstproducts[index].description,
                                "id": lstproducts[index].id,
                                "rating": lstproducts[index].ratings,
                                "stock": lstproducts[index].stock,
                                "reviews": lstproducts[index].reviews,
                                "time": lstproducts[index].time,
                              });
                            },
                          );
                        });
                  } else {
                    return const Center(
                      child: Text("No data"),
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
