import 'package:flutter/material.dart';
import 'prime_validator.dart';

class PrimeNumber extends StatefulWidget {
  createState() => PrimeNumberState();
}

class PrimeNumberState extends State<PrimeNumber> {
  
  final PrimeValidator primeValidator = new PrimeValidator();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var inputVal;

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
                      validator: (val) => val.isEmpty? "Value required": null,
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
      var ret = primeValidator.isPrime(int.parse(inputVal));
      if (ret == 0) {
        print ("PRIME");
      } else {
        print ("NOT A PRIME. Divisible by " + ret.toString());
      }
    }
  }
}