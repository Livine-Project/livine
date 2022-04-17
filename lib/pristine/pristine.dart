// ignore_for_file: type_annotate_public_apis

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../translations/locale_keys.g.dart';

class Pristine extends StatefulWidget {
  const Pristine({Key? key}) : super(key: key);

  @override
  State<Pristine> createState() => _PristineState();
}

class _PristineState extends State<Pristine> {
  List<PaymentItem> _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '0.00',
      status: PaymentItemStatus.final_price,
    )
  ];

  void onGooglePayResult(data) {
    debugPrint(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/icon/pristine_back.jpg'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child:
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Image.asset(
                        'assets/images/icon/pristine.png',
                        width: 80.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    PristineText(
                      name: LocaleKeys.life_pristine.tr(),
                    ),
                  ],
                ),
                          ),
                          SizedBox(
                height: 10.0,
                          ),
                          Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FeaturesText(
                      name:
                          LocaleKeys.Pristine_access.tr(),
                    ),
                  ],
                ),
                          ),
                          SizedBox(
                height: 50.0,
                          ),
                          Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                elevation: 2,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 150,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            LocaleKeys.gateway.tr(),
                                            style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          GooglePayButton(
                                            width: 200,
                                            height: 60,
                                            paymentConfigurationAsset:
                                                'pay.json',
                                            paymentItems: _paymentItems,
                                            margin: const EdgeInsets.only(
                                                top: 15.0),
                                            onPaymentResult: onGooglePayResult,
                                            loadingIndicator: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ]),
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.three_months.tr(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "${LocaleKeys.total_price.tr()} \$10.00",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "\$10.00",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      LocaleKeys.monthly.tr(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 0, 96, 145)))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      LocaleKeys.cancel_sub.tr(),
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    )
                  ],
                ),
                          )),
                        ]),
              ),
        ),
      ),
    );
  }
}

class FeaturesText extends StatelessWidget {
  const FeaturesText({
    Key? key,
    @required this.name,
  }) : super(key: key);
  final name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$name",
        style: TextStyle(fontSize: 15.0, color: Colors.white),
      ),
    );
  }
}

class PristineText extends StatelessWidget {
  const PristineText({
    Key? key,
    @required this.name,
  }) : super(key: key);
  final name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
