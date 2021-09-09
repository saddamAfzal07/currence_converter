import 'package:currence_converter/Model/ratesfetch.dart';
import 'package:currence_converter/functions/fetchrates.dart';
import 'package:currence_converter/widgets/AnyToAny.dart';
import 'package:currence_converter/widgets/UsdToAny.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Map> allCurrencies;
  late Future<RatesModel> ratesModel;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ratesModel = fetchrates();
    allCurrencies = fetchcurrencies();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
      ),
      body: Container(
        width: w,
        height: h,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/currency.jpeg",
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Form(
              key: formkey,
              child: FutureBuilder<RatesModel>(
                  future: ratesModel,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print("working");
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: FutureBuilder<Map>(
                            future: allCurrencies,
                            builder: (context, currsnapshot) {
                              if (currsnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Usdtoany(
                                        rates: snapshot.data!.rates,
                                        Curriencies: currsnapshot.data!),
                                    AnytoAny(
                                        rates: snapshot.data!.rates,
                                        curriencies: currsnapshot.data!)
                                  ],
                                );
                              }
                            }),
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
