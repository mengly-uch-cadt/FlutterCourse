import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key, required this.onStartPressed});
  final VoidCallback onStartPressed;

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {

  final TextEditingController _controller = TextEditingController();
  String _fahrenheit = '0';

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white)
  );

  void _convertToFahrenheit() {
    final celsius = double.tryParse(_controller.text);
    if (celsius != null) {
      setState(() {
        _fahrenheit = ((celsius * 9 / 5) + 32).toStringAsFixed(2);
      });
    }else{
      setState(() {
        _fahrenheit = 'Invalid input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.thermostat_outlined,
                size: 120,
                color: Colors.white,
              ),
              const Center(
                child: Text(
                  "Converter",
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
              ),
              const SizedBox(height: 50),
              const Text("Temperature in Degrees:"),
              const SizedBox(height: 10),
              TextField(
                  decoration: inputDecoration,
                  controller: _controller,
                  onChanged:(value) => _convertToFahrenheit(),
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 30),
              const Text("Temperature in Fahrenheit:"),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: textDecoration,
                child: Text(
                  _fahrenheit,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              // IconButton(onPressed: widget.onStartPressed, icon: const Icon(Icons.arrow_back, color: Colors.white)),
              TextButton(
                onPressed: widget.onStartPressed,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Back', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        )),
    );
  }
}
