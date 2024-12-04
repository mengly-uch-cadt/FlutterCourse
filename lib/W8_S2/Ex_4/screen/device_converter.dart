import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Currency { usd, euro, riel }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  Currency? selectedCurrency = Currency.usd;

  // Extra string but it is needed as parameter for below function
  String currentInputValue = "";

  void selectCurrencyCallback(Currency? currency) {
    setState(() {
      selectedCurrency = currency;
    });

    // This make the conversion happend imediately when selecting different currency
    convert(input: currentInputValue);
  }

  String converted = "";

  void convert({required String input}) {
    if (input.isEmpty) {
      setState(() => converted = "");
      return;
    }

    currentInputValue = input;
    double value = double.parse(input);

    switch (selectedCurrency!) {
      case Currency.usd:
        break;
      case Currency.euro:
        value = value * 0.95;
        break;
      case Currency.riel:
        value = value * 4000;
        break;
    }

    setState(() => converted = value.toString());
  }

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white)),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) => convert(input: value),
          ),
          const SizedBox(height: 30),
          DropdownButton(
              value: selectedCurrency,
              items: Currency.values.map((Currency currency) {
                return DropdownMenuItem<Currency>(
                  value: currency,
                  child:
                      Text(currency.toString().split(".").last.toUpperCase()),
                );
              }).toList(),
              onChanged: selectCurrencyCallback),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(converted.isEmpty ? "" : converted))
        ],
      )),
    );
  }
}
