import 'package:flutter/material.dart';
import 'prime_validator.dart';
import 'prime_storage.dart';
import 'dart:collection';


class PrimeNumber extends StatefulWidget {
  createState() => PrimeNumberState();
}

class PrimeNumberState extends State<PrimeNumber> {
  
  final PrimeValidator primeValidator = new PrimeValidator();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final PrimeStorage storage = new PrimeStorage();
  Set primeSet = new HashSet<int>();
  var inputVal;

  @override
  void initState() {
    super.initState();
    storage.readPrimeList().then((List<String> primeStrings) {
      setState(() {
        if (primeStrings.isEmpty) {
          print("File not found or is empty ");
        } else {
          print("File found");
        }
        primeStrings.forEach((element) => primeSet.add(int.parse(element)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kya re PRIME ah?'),
      ),
      body: new SafeArea(
          child: new Form(
              key: _formKey,
              child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter a number',
                          border: const UnderlineInputBorder(),
                          filled: true,
                          labelText: "Prime Number ah"
                      ),
                      autofocus: true,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onSaved: (val) => inputVal = val,
                      validator: (val) => isValidNumber(val),
                    ),
                    new Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: new RaisedButton(
                          onPressed: validateInput,
                          child: new Text('Kaala'),
                        )
                    ),
                  ]
              )
          ),
      )
    );
  }

  void validateInput() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      print('Form is not valid! Please review and correct');
    } else {
      form.save();
//      String formattedInput = "";
      unnecessaryInputs().forEach((input) {
        inputVal = inputVal.toString().trim().replaceAll(input, '');
      });
      int inputNum = int.parse(inputVal);

      if (primeSet.contains(inputNum)) {
        print ("Thambi, oru thadava thaan. Oyaaama potukute iruka...");
      } else {
        var divisor = primeValidator.isPrime(inputNum);
        if (divisor == 0) {
          print("PRIME");
          primeSet.add(inputNum);
          addToPrimeList();
        } else {
          print("NOT A PRIME. Divisible by " + divisor.toString());
        }
      }
    }
  }

  List unnecessaryInputs(){
    return [","];
  }

  String isValidNumber(String value){
    unnecessaryInputs().forEach((input) {
      value = value.toString().trim().replaceAll(input, '');
    });
    var message;
    if(value.isEmpty)
      message = "Required";
    if(int.tryParse(value)==null)
      message = "Invalid";
    return message;
  }

  void addToPrimeList() {
    storage.updatePrimeList(primeSet);
  }
}