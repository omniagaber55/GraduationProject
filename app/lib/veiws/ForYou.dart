import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/CustomDeviceCard.dart';
import 'package:app/constants.dart';
import 'package:app/models/Device.dart';
import 'package:app/services/GetAllDevices.dart';
import 'package:app/veiws/EditDevice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForyouDevice extends StatefulWidget {
  const ForyouDevice({Key? key}) : super(key: key);

  @override
  State<ForyouDevice> createState() => _ForyouDeviceState();
}

class _ForyouDeviceState extends State<ForyouDevice> {
  bool ispressed = false;
  late Future<List<DeviceModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = AllProductsService().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          EditDeviceAdd(), // Navigate to SignUpAsBuyer for Buyer
                      ),
                    );
            },
            icon: const Icon(
              Icons.edit_square,
              color: White,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: PrimaryColor,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          width: 29.67,
                          height: 29.67,
                          image: AssetImage(
                            'assets/images/foryou.png',
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "For You",
                          style: TextStyle(
                            color: White,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Stack(
                          children: [
                            Container(
                              width: 250,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: White,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(500),
                                  topLeft: Radius.circular(500),
                                  bottomLeft: Radius.circular(500),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'You have saved 25 L of gas Which Turn on the stove for 3 H',
                                      textStyle: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff009589),
                                      ),
                                      speed: const Duration(milliseconds: 200),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 200),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 190, top: 50),
                              child: Lottie.asset(
                                "assets/images/nTJyEKJ42j.json",
                                width: 220,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 20),
                child: Text(
                  "Let us know how long we can turn the machines on",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "choose devices which you want to swich on",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<DeviceModel>>(
                future: _productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemCount: products.length,
  itemBuilder: (context, index) {
    final product = products[index];
    bool isFourthOrFifth = index == 3 || index == 4;
    bool usePrimaryColor = isFourthOrFifth; // Determine if primary color should be used

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: CustomDeviceCard(
        product: product,
        index: index,
        isPrimaryColor: usePrimaryColor, // Pass the parameter to CustomDeviceCard
      ),
    );
  },
);

                  }
                },
              ),
              const SizedBox(height: 20),
              CustomButton(onTap: () {}, label: "Add Device"),
              const SizedBox(height: 10),
              CustomButton(onTap: () {}, label: "Done"),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

