// import 'dart:convert';

enum Skill { FLUTTER, DART, OTHER }

class Address{
  final String street;
  final String city;
  final int zipCode; 
  
  Address({required this.city,required this.street,required this.zipCode});

  @override
  String toString() {
    return """
City: $city, 
    Street: $street, 
    Zip Code: $zipCode""";
  }
}

class Employee {
  final String name;
  final double baseSalary;
  final int yearOfExperience;
  final Address address;
  List<Skill> skills = [];
  

  Employee({
    required this.name,
    required this.baseSalary,
    required this.yearOfExperience,
    required this.address,
    this.skills = const []
  });

  Employee.mobileDeveloper({
    required this.name,
    required this.baseSalary,
    required this.yearOfExperience,
    required this.address,
    this.skills = const [Skill.FLUTTER, Skill.DART]
  });

  // in this exercise i want to use print function
  Map<Skill, int> getSkillBonus(){
    return {
      Skill.FLUTTER: 5000, 
      Skill.DART: 3000,
      Skill.OTHER: 1000
    };
  }

  double calculateTotalSalary() {
    int experienceBonus = yearOfExperience * 2000;
    // fold is iterate over a collection
    int skillBonus = skills.fold(0, (sum, skill) => sum + getSkillBonus()[skill]!); // use ! sure that the value return is not null
    return baseSalary + experienceBonus + skillBonus;
  }
  void printDetails(){
  print("""
Employee: 
  Name: $name,
  Base salary: $baseSalary
  Address: 
    $address
  Year of Exp: $yearOfExperience
  Skills:
    ${skills.isNotEmpty ? skills.map((skill) => "${skill.name.toLowerCase()}, ${getSkillBonus()[skill]}\$").join('\n    ') : "No skills"}
  Total Salary: ${calculateTotalSalary()} 
  """
    ); 
  }
}

void main() {

  var emp1 = Employee.mobileDeveloper(
    name: 'Sokea',
    baseSalary:  40000, 
    yearOfExperience: 2, 
    address: Address(
      city: "PP", 
      street: "233", 
      zipCode: 12001
  ));
  
  emp1.printDetails();
}