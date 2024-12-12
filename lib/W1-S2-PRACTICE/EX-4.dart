void main() {
  // Pizza prices map
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni'];

  // Initialize total cost
  double total = 0;

  // Iterate through the order
  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      // Add the price of the pizza to the total
      total += pizzaPrices[pizza]!;
    } else {
      // Print a message if the pizza is not on the menu
      print('$pizza pizza is not on the menu');
      return;
    }
  }

  // Print the total cost of the order
  print('Total: \$${total.toStringAsFixed(2)}');
}
