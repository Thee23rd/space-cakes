
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:http/http.dart' as http;

class PaymentInitilization extends StatefulWidget {
  const PaymentInitilization({Key? key}) : super(key: key);

  @override
  State<PaymentInitilization> createState() => PaymentInitilizationState();
}

class PaymentInitilizationState extends State<PaymentInitilization> {
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
    String textcontrollerAMOUNT,
    String textcontrollerEMAIL,
  ) async {
    final Customer customer = Customer(
        name: "Flutterwave Developer",
        phoneNumber: "0962604525",
        //include phonenumber here!!!!
        email: textcontrollerEMAIL);
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-14693cf2dbbeb37cdabafebf73023bce-X",
        currency: "ZMW",
        redirectUrl:
            "https://developer.flutterwave.com/docs/collecting-payments/standard/",
        txRef: _ref!,
        amount: '300',
        customer: customer,
        paymentOptions: "USSD, card",
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
      backgroundColor: Colors.deepPurple[300],
    );
  }
}
