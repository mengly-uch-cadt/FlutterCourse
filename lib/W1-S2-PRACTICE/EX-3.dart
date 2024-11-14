// Exercise 3 - Filter the list of scores to get the passing scores
void main() {
  // Input list of scores
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];

  // Filter the list using where() to get the passing scores
  List<int> passedStudents = scores.where((score) => score >= 50).toList();

  // Output the filtered list and the number of students who passed
  print(passedStudents);
  print('${passedStudents.length} students passed');
}
