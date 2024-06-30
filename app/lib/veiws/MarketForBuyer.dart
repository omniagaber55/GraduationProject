import 'package:app/constants.dart';
import 'package:app/models/market.dart';
import 'package:app/veiws/ListVeiwChat.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/CustomProductCard.dart';
import 'package:app/services/get_all_product_service.dart';

class MarketForBuyer extends StatefulWidget {
  const MarketForBuyer({Key? key});

  @override
  State<MarketForBuyer> createState() => _MarketForBuyerState();
}

class _MarketForBuyerState extends State<MarketForBuyer> {
  late Future<List<ProductModel>>
      _productsFuture; // Future for getting all products

  @override
  void initState() {
    super.initState();
    _productsFuture = AllProductsService()
        .getAllProducts(); // Initializing the future to fetch all products
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LIstViewChat(), // Navigate to ListVeiwChat screen on tap
                          ),
                        );
                      },
                      child: const Image(
                        image: AssetImage(
                            'assets/images/marketuser.png'), // Displaying user icon
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Biovoltex’s Market", // Title for the market
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: ThirdColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Image(
              width: 200,
              height: 138.6,
              image: AssetImage(
                  'assets/images/market.png'), // Displaying market image
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      PrimaryColor,
                      White,
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
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: FutureBuilder<List<ProductModel>>(
                        future: _productsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child:
                                  CircularProgressIndicator(), // Show loading indicator while fetching products
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                  'Error: ${snapshot.error}'), // Show error message if data fetching fails
                            );
                          } else {
                            final products = snapshot.data!;

                            return GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];

                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 30),
                                    child: InkWell(
                                      onTap: () {
                                        // Handle tap on the card
                                      },
                                      child: CustomCard(
                                        product:
                                            product, // Pass product data to custom card
                                      ),
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
      ),
    );
  }
}
