// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:flutterwave_standard/flutterwave.dart';


class CakeCard extends StatefulWidget {
  final String name;
  final String imageUrl;
  final double price;

  CakeCard({required this.name, required this.imageUrl, required this.price});

  @override
  State<CakeCard> createState() => _CakeCardState();
}

class _CakeCardState extends State<CakeCard> {
 String? _ref;

  void setRef() {
    Random random = Random();
    int numbers = random.nextInt(2000);
    if (Platform.isAndroid) {
      setState(() {
        _ref = "VillageBankingAndroid123$numbers";
      });
    } else {
      setState(() {
        _ref = "VillageBankingIOS123$numbers";
      });
    }
  }

  @override
  void initState() {
    setRef();
    super.initState();
  }

   void handlePaymentInitialization(
  ) async {
    final Customer customer = Customer(
        name: "Flutterwave Developer",
        phoneNumber: "",
        //include phonenumber here!!!!
        email: 'malatefriday12@gmail.com');
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-14693cf2dbbeb37cdabafebf73023bce-X",
        currency: "ZMW",
        redirectUrl:
            "https://developer.flutterwave.com/docs/collecting-payments/standard/",
        txRef: _ref!,
        amount: '300',
        customer: customer,
        paymentOptions: "card,ussd",
        customization: Customization(title: "My Payment"),
        isTestMode: true);

    final ChargeResponse response = await flutterwave.charge();
    if (response.status == 'cancelled') {
      print(response.status.toString());
      // Show an error message
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Message'),
              content: Text(response.status.toString()),
              actions: <Widget>[
                MaterialButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {

      // Navigate to a new page to show the new balance
      Navigator.pushReplacementNamed(context, '/');

      print(response.status.toString());
      // Show an error message
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(''),
              content: Text(response.status.toString()),
              actions: <Widget>[
                MaterialButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 290,top: 5),
        child: Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
            height: 350,
            width: 300,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 2.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Expanded(
                                child: ClipRRect(
                                  child: Image.asset(
                                    widget.imageUrl,
                                    
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(21.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'ZMW ${widget.price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  ElevatedButton(
                                    onPressed: () async => {handlePaymentInitialization(),},
                                      // Add to cart functionality
                      
                                    child: Text(
                                      'Pay',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(vertical: 12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
