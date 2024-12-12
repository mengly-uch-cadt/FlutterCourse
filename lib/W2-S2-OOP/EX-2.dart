enum AccountStatus {Active, Deactive, Freeze}
enum Job {Teacher, Tutor, Developer, Police, Designer}
enum Country {Cambodia, Thailand, Vietnam, Malaysia, Singapore, Indonesia, Laos}
class Address{
  String street;
  String city;
  int zipCode; 
  Country country;
  Address({required this.city,required this.street,required this.zipCode, required this.country});

  @override
  String toString() {
    return """
City: $city, 
        Street: $street, 
        Zip Code: $zipCode
        Country: ${country.toString().split(".").last}""";
  }
}

class Person{
  String firstName; 
  String lastName; 
  final DateTime dateOfBirth;
  Job job;
  Address address;

  Person({
    required this.firstName, 
    required this.lastName, 
    required this.dateOfBirth, 
    required this.job, 
    required this.address
  });
  
  @override
  String toString(){
    return """
Firstname: $firstName, 
      Lastname: $lastName, 
      Date of birth: ${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day},
      Job: ${job.toString().split(".").last}, 
      Address: 
        $address
""";
  }
}

class BankAccount {
  final int accountID; 
  double balance;
  AccountStatus accountStatus; 
  Person person;

  BankAccount({
    required this.accountID, 
    required this.balance, 
    this.accountStatus = AccountStatus.Active, 
    required this.person
  });

  // Method to return the current balance
  double getBalance() {
    return balance;
  }

  // Withdraw 
  double withdraw(double amount){
    if(amount <= 0){
      throw Exception("Invalid amount. Please enter amount greater than 0!");
    }

    if(balance >= amount){
      balance -= amount;
      return balance;
    }
    else{
      throw Exception("Insufficient balance. Your balance is\$${balance.toStringAsFixed(2)}"); // take 2 digit after dot 
    }
  }

  // Credit 
  double credit(double amount){
    return balance += amount;
  }

  @override
  String toString(){
    return """
  BankAccount: 
    Id: $accountID, 
    Balance: $balance, 
    Account Status: ${accountStatus.toString().split(".").last},
    Person: 
      $person
""";
  }

}

 class Bank {
  List<BankAccount> _account = []; // Ensure this is consistent with the rest of the code

  Bank();

  // method to create a new account 
  BankAccount createAccount(int accountID, double initialBalance, AccountStatus accountStatus, Person person) {
    for (var account in _account) {
      if (account.accountID == accountID) {
        throw Exception("Account with ID $accountID already exists!!");
      }
    }

    BankAccount newAccount = BankAccount(
      accountID: accountID,
      balance: initialBalance,
      accountStatus: accountStatus,
      person: person
    );
    _account.add(newAccount);
    return newAccount;
  }

  // Get account by ID 
  BankAccount getAccountById(int accountID) {
    try {
      return _account.firstWhere((account) => account.accountID == accountID);
    } catch (e) {
      throw Exception("Account with ID $accountID not found!");
    }
  }

  // Deposit money into an account
  void deposit(int accountID, double amount) {
    BankAccount account = getAccountById(accountID);
    account.credit(amount);
  }

  // Withdraw money from an account
  void withdraw(int accountID, double amount) {
    BankAccount account = getAccountById(accountID);
    account.withdraw(amount);
  }

  // List all accounts
  void listAccounts() {
    if (_account.isEmpty) {
      print("No accounts found.");
    } else {
      for (var account in _account) {
        print(account);
      }
    }
  }
}

void main() {
// Create the Bank instance
  Bank myBank = Bank();

  // Create a Person instance
  Person person1 = Person(
    firstName: "Uch",
    lastName: "Mengly",
    dateOfBirth: DateTime(2002, 8, 31),
    job: Job.Developer,
    address: Address(
      city: "Phnom Penh",
      street: "238",
      zipCode: 12000,
      country: Country.Cambodia,
    ),
  );

  Person person2 = Person(
    firstName: "Sok",
    lastName: "Ronan",
    dateOfBirth: DateTime(1995, 5, 20),
    job: Job.Teacher,
    address: Address(
      city: "Siem Reap",
      street: "456",
      zipCode: 21000,
      country: Country.Cambodia,
    ),
  );

  // Create BankAccounts for the persons
  BankAccount account1 = myBank.createAccount(1, 100.0, AccountStatus.Active, person1);
  BankAccount account2 = myBank.createAccount(2, 200.0, AccountStatus.Active, person2);

  // Print initial account balances
  print("------------------- Initial Balances ------------------");
  myBank.listAccounts();

  // Deposit and withdraw 
  print("------------------- Deposit to Account 1 ------------------");
  myBank.deposit(1, 50.0); 
  print(myBank.getAccountById(1));

  print("------------------- Withdraw from Account 2 ------------------");
  myBank.withdraw(2, 30.0); 
  print(myBank.getAccountById(2));

  // List all accounts
  print("------------------- All Bank Accounts ------------------");
  myBank.listAccounts();

  // Try withdrawing more than available balance to test exception handling
  try {
    print("------------------- Withdraw Insufficient Funds ------------------");
    myBank.withdraw(1, 200.0); 
  } catch (e) {
    print(e); // output the exception
  }

}



