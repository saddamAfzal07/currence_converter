import 'package:currence_converter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class Usdtoany extends StatefulWidget {
  final rates;
  final Map Curriencies;
  const Usdtoany({Key? key, @required this.rates, required this.Curriencies})
      : super(key: key);

  @override
  _UsdtoanyState createState() => _UsdtoanyState();
}

class _UsdtoanyState extends State<Usdtoany> {
  TextEditingController usdcontroller = TextEditingController();
  String? Dropdownvalue = 'AUD';
  String answer = 'Converted Currency will be shown here :)';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "USD to Any Curriency",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              key: ValueKey('usd'),
              controller: usdcontroller,
              decoration: InputDecoration(
                hintText: "Enter USD",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: Dropdownvalue,
                    icon: Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        Dropdownvalue = newvalue;
                      });
                    },
                    items: widget.Curriencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = usdcontroller.text +
                          ' USD =' +
                          convertusd(
                              widget.rates, usdcontroller.text, Dropdownvalue) +
                          ' ' +
                          Dropdownvalue!;
                    });
                  },
                  child: Text("Convert"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor,
                  )),
                )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(answer),
            )
          ],
        ),
      ),
    );
  }
}
