import 'package:app/Components/CustomProductCard.dart';
import 'package:app/constants.dart';
import 'package:app/models/market.dart';
import 'package:app/services/GetAllDevices.dart';
import 'package:app/services/get_all_product_service.dart';
import 'package:app/veiws/AddItem.dart';
import 'package:flutter/material.dart';

class MarketForUser extends StatefulWidget {
  const MarketForUser({super.key});

  @override
  State<MarketForUser> createState() => _MarketForUserState();
}

class _MarketForUserState extends State<MarketForUser> {
  late Future<List<ProductModel>> _productsFuture;
  @override
  void initState() {
    super.initState();
    _productsFuture = AllProductsService().getAllProducts() as Future<List<ProductModel>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: PrimaryColor),
        elevation: 0,
        backgroundColor: const Color.fromARGB(235, 248, 248, 248),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              "Biovoltex’s Market",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: ThirdColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image(
            width: 200,
            height: 138.6,
            image: const AssetImage('assets/images/market.png'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    PrimaryColor,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(66),
                  topRight: Radius.circular(66),
                ),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: 380,
                    margin: const EdgeInsets.only(top: 20, left: 8, right: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddItem(),
                      ),
                    );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          White,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                                width: 26.67,
                                height: 26.67,
                                image: AssetImage(
                                  'assets/images/add.png',
                                )),
                            SizedBox(width: 11),
                            Text(
                              "Add Item",
                              style: TextStyle(
                                color: PrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: FutureBuilder<List<ProductModel>>(
                      future: _productsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          final products = snapshot.data!;

                          return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];

                              return Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                                  child: CustomCard(
                                    product: product,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
