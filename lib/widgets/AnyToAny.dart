import 'package:currence_converter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class AnytoAny extends StatefulWidget {
  final rates;
  final Map curriencies;
  const AnytoAny({Key? key, @required this.rates, required this.curriencies})
      : super(key: key);

  @override
  _AnytoAnyState createState() => _AnytoAnyState();
}

class _AnytoAnyState extends State<AnytoAny> {
  TextEditingController amountcontroller = TextEditingController();
  String? Dropdownvalue1 = 'AUD';
  String? Dropdownvalue2 = 'AUD';
  String answer = 'Converted Currency will be shown here :)';
  @override
  Widget build(BuildContext context) {
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
              controller: amountcontroller,
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
                //First
                Expanded(
                  child: DropdownButton<String>(
                    value: Dropdownvalue1,
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
                        Dropdownvalue1 = newvalue;
                      });
                    },
                    items: widget.curriencies.keys
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

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("To"),
                ),

//Second
                Expanded(
                  child: DropdownButton<String>(
                    value: Dropdownvalue2,
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
                        Dropdownvalue2 = newvalue;
                      });
                    },
                    items: widget.curriencies.keys
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
              ],
            ),

            //  Button
            Container(
                child: ElevatedButton(
              onPressed: () {
                setState(() {
                  answer = amountcontroller.text +
                      ' USD =' +
                      convertAny(widget.rates, amountcontroller.text,
                          Dropdownvalue1, Dropdownvalue2) +
                      ' ' +
                      Dropdownvalue2!;
                });
              },
              child: Text("Convert"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Theme.of(context).primaryColor,
              )),
            )),
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
