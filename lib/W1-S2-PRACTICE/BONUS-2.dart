// Function to check if the brackets are balanced
String checkBalanced(String input) {
  // Stack to hold opening brackets
  List<String> stack = [];

  // Map to hold matching pairs of brackets
  Map<String, String> matchingBrackets = {
    ')': '(',
    ']': '[',
    '}': '{',
  };

  // Loop through each character in the input
  for (var char in input.split('')) {
    // If the character is an opening bracket, push it onto the stack
    if (char == '(' || char == '[' || char == '{') {
      stack.add(char);
    }
    // If the character is a closing bracket, check if it matches the top of the stack
    else if (char == ')' || char == ']' || char == '}') {
      // If the stack is empty or the top doesn't match the closing bracket, return "Not balanced"
      if (stack.isEmpty || stack.removeLast() != matchingBrackets[char]) {
        return "Not balanced";
      }
    }
  }

  // If the stack is empty at the end, all brackets were matched
  return stack.isEmpty ? "Balanced" : "Not balanced";
}

// Main function to test the examples
void main() {
  // Test cases
  print(checkBalanced("{what is (42)}?")); // Balanced
  print(checkBalanced("[text}"));          // Not balanced
  print(checkBalanced("{[[(a)b]c]d}"));    // Balanced
}
